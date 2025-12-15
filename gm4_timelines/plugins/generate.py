from beet import Context, JsonFile, Function, NamespaceFileScope # pyright: ignore[reportMissingImports]
from pydantic import BaseModel # pyright: ignore[reportMissingImports]
from typing import Tuple, Dict, Any, List, Optional, ClassVar
from pathlib import Path
import json
import copy

TICK_FACTOR: int = 3
TICK_OFFSET: int = -6000
DAY_DURATION_TICKS = 24000
FOLDER_PATH: Path = Path("gm4_timelines/raw_data")
SLIME_VALUES = {
    "full_moon": 0.5,
    "waning_gibbous": 0.375,
    "third_quarter": 0.25,
    "waning_crescent": 0.125,
    "new_moon": 0,
    "waxing_crescent": 0.125,
    "first_quarter": 0.25,
    "waxing_gibbous": 0.375,
}

# ------------------
# - PYDANTIC STUFF -
# ------------------

class Keyframe(BaseModel):
    ticks: int
    value: Any

class Track(BaseModel):
    keyframes: List[Keyframe] = []
    modifier: Optional[str] = None
    ease: Optional[Any] = None

class TimelineData(BaseModel):
    period_ticks: int
    tracks: Dict[str, Track] = {}

class ScheduleEntry(BaseModel):
    time: int
    effects: Dict[str, Any] = {}
    functions: List[str] = []

class DayData(BaseModel):
    settings: Dict[str, Any] = {}
    schedule: List[ScheduleEntry] = []

class Timeline(JsonFile):
    scope: ClassVar[NamespaceFileScope] = ("timeline",)
    extension: ClassVar[str] = ".json"


# -------------
# - FUNCTIONS -
# -------------

def beet_default(ctx: Context) -> None:
    # We register Timeline to Beet here since it doesn't support it yet, when it does this can be removed
    ctx.data.extend_namespace += [Timeline]

    vanilla_folder = FOLDER_PATH / "vanilla"

    for file_path in vanilla_folder.glob("*.json"):
        with file_path.open("r", encoding="utf-8") as f:
            data_dict: Dict[str, Any] = json.load(f)
        data = TimelineData(**data_dict)

        # factor and offset the ticks so it matches the new daytime
        data = factor_ticks(data)

        file_name = file_path.stem
        if file_name == "day":
            data = register_days(ctx, data)

        ctx.data[f"minecraft:{file_name}"] = Timeline(data.model_dump())



def factor_ticks(data: TimelineData) -> TimelineData:
    """
    Each keyframe tick is shifted by a fixed offset, wrapped to the original
    period, and then multiplied by the tick factor. The timeline period
    itself is also scaled accordingly.

    Args:
        data: Timeline data whose ticks will be modified.

    Returns:
        TimelineData instance with modified tick values.
    """
    factored_data = copy.deepcopy(data)
    period = factored_data.period_ticks

    # offset and scale the ticks
    for track in factored_data.tracks.values():
        for kf in track.keyframes:
            kf.ticks = ((kf.ticks + TICK_OFFSET) % period) * TICK_FACTOR
        track.keyframes.sort(key=lambda k: k.ticks)

    # scale the period
    factored_data.period_ticks = period * TICK_FACTOR

    return factored_data



def register_days(ctx: Context, data: TimelineData) -> TimelineData:
    """
    Load day definition files from either dev or days folder. Build combined
    timeline by concatenating the tracks of each day's timeline

    Args:
        data: Base timeline used as the default state for each generated day.

    Returns:
        TimelineData instance representing the concatenated day timeline.
    """
    dev_folder = FOLDER_PATH / "dev"
    dev_files = list(dev_folder.glob("*.json"))

    if dev_files:
        return process_day_files(ctx, dev_folder, data, is_dev=True)
    else:
        days_folder = FOLDER_PATH / "days"
        return process_day_files(ctx, days_folder, data)



def process_day_files(
        ctx: Context,
        folder_path: Path,
        default_data: TimelineData,
        is_dev: bool = False
        ) -> TimelineData:
    """
    Load each day definition from provided folder and build a timeline for them.
    Days are added once per supported moon phase. Also collects metadata needed to
    register the day into storage for the datapack.

    Args:
        folder_path: Directory containing day definition JSON files.
        default_data: Default timeline used as a base for each day.
        is_dev (default = False): Whether the day data comes from the development folder.

    Returns:
        TimelineData instance representing the concatenated day timeline.
    """
    function_data: List[Dict[str, Any]] = []
    full_timeline = TimelineData(period_ticks=0, tracks={})

    # loop over day definitions
    for file_path in folder_path.glob("*.json"):
        with file_path.open("r", encoding="utf-8") as f:
            day_data_dict = json.load(f)
        day_data = DayData(**day_data_dict)

        # loop over supported moon phases
        moon_phases = day_data.settings.get("moon_phase", [])
        for moon_phase in moon_phases:
            day_build, functions = register_day(default_data, day_data, moon_phase)
            full_timeline = append_to_timeline(full_timeline, day_build)

            function_data.append({
                "moon_phase": moon_phase,
                "in_type": day_data.settings['in_type'],
                "out_type": day_data.settings['out_type'],
                "weight": day_data.settings['weight'],
                "start_time": full_timeline.period_ticks,
                "functions": functions,
                "dev": is_dev
            })

            full_timeline.period_ticks += day_build.period_ticks

    # create function
    day_duration = DAY_DURATION_TICKS * TICK_FACTOR
    ctx.data["gm4_timelines:register/days"] = Function([
        "# register days",
        "# generated from generate.py",
        "",
        f'data modify storage gm4_timelines:data day_duration set value {day_duration}',
        f'data modify storage gm4_timelines:data day_registry set value {function_data}',
    ])

    return full_timeline



def register_day(
        default_data: TimelineData,
        day_data: DayData,
        moon_phase: str
        ) -> Tuple[TimelineData, List[Dict[str, Any]]]:
    """
    Build the day data for a day definition, add moon phase and slime spawn chance
    tracks and get scheduled function calls. Any non-modified tracks are taken from default_data

    Args:
        default_data: Base timeline providing default tracks and values.
        day_data: Parsed day configuration and schedule.
        moon_phase: Moon phase identifier for this day variant.

    Returns:
        A tuple containing the generated day timeline and a list of function
        calls to be triggered at specific ticks.
    """
    result = TimelineData(period_ticks=default_data.period_ticks, tracks={})
    seen_tracks: set[str] = set()
    functions: List[Dict[str, Any]] = []

    # create the moon phase track
    track_name = "minecraft:visual/moon_phase"
    result.tracks[track_name] = Track(
        keyframes=[Keyframe(ticks=0, value=moon_phase)]
    )
    seen_tracks.add(track_name)

    # create the surface slime spawn chance track
    slime_value = SLIME_VALUES.get(moon_phase, 0.0)
    track_name = "minecraft:gameplay/surface_slime_spawn_chance"
    result.tracks[track_name] = Track(
        keyframes=[Keyframe(ticks=0, value=slime_value)],
        modifier="maximum",
        ease="constant"
    )
    seen_tracks.add(track_name)

    # any tracks in the schedule
    for entry in day_data.schedule:
        ticks = entry.time
        effects = entry.effects

        # register function calls
        if entry.functions:
            functions.append({"tick":ticks,"functions":entry.functions})

        # transform effects into timeline tracks
        for effect_name, value in effects.items():
            track_name = f"minecraft:{effect_name}"
            seen_tracks.add(track_name)

            track = result.tracks.get(track_name)
            if not track:
                default_track = default_data.tracks.get(track_name)
                track = Track(
                    keyframes=[],
                    modifier=default_track.modifier if default_track else None,
                    ease=default_track.ease if default_track else None
                )
                result.tracks[track_name] = track

            track.keyframes.append(Keyframe(ticks=ticks, value=value))

    # copy over untouched default tracks
    for track_name, track_data in default_data.tracks.items():
        if track_name not in seen_tracks:
            result.tracks[track_name] = copy.deepcopy(track_data)

    return result, functions


def append_to_timeline(full_timeline: TimelineData, new_data: TimelineData) -> TimelineData:
    """
    Append the next day timeline into the full timeline by offsetting its ticks, they are
    shifted by the current period of the full timeline and then merged into the matching
    tracks.

    Args:
        full_timeline: The timeline being appended to.
        new_data: The timeline segment to append.

    Returns:
        The build timeline with the new timeline data merged in.
    """
    offset = full_timeline.period_ticks

    for track_name, src_track in new_data.tracks.items():

        # find matching track, or create if neccesary
        dst_track = full_timeline.tracks.get(track_name)
        if not dst_track:
            dst_track = Track(
                keyframes=[],
                modifier=src_track.modifier,
                ease=copy.deepcopy(src_track.ease)
            )
            full_timeline.tracks[track_name] = dst_track

        # append the keyframes, adding the offset to each ticks value
        for kf in src_track.keyframes:
            dst_track.keyframes.append(
                Keyframe(ticks=kf.ticks + offset, value=copy.deepcopy(kf.value))
            )

    return full_timeline
