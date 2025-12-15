from beet import Context, JsonFile, Function, NamespaceFileScope
from pathlib import Path
import json
import copy
from typing import Tuple, Dict, Any, List, Optional, ClassVar
from pydantic import BaseModel

TICK_FACTOR: int = 3
TICK_OFFSET: int = -6000
FOLDER_PATH: str = "gm4_timelines/raw_data/"


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
    ctx.data.extend_namespace += [Timeline]

    vanilla_folder = Path(FOLDER_PATH) / "vanilla"

    for file_path in vanilla_folder.glob("*.json"):
        with file_path.open("r", encoding="utf-8") as f:
            data_dict: Dict[str, Any] = json.load(f)
        data = TimelineData(**data_dict)

        # factor and offset the ticks so it matches the new daytime
        data = factor_ticks(ctx, data)

        file_name = file_path.stem
        if file_name == "day":
            data = register_days(ctx, data)

        ctx.data[f"minecraft:{file_name}"] = Timeline(data.model_dump())



def factor_ticks(ctx: Context, data: TimelineData) -> TimelineData:
    """
    """
    period = data.period_ticks

    # offset and scale the ticks
    for track in data.tracks.values():
        for kf in track.keyframes:
            kf.ticks = ((kf.ticks + TICK_OFFSET) % period) * TICK_FACTOR
        track.keyframes.sort(key=lambda k: k.ticks)

    # scale the period
    data.period_ticks = period * TICK_FACTOR

    return data



def register_days(ctx: Context, data: TimelineData) -> TimelineData:
    """
    """
    build_timeline = TimelineData(period_ticks=0, tracks={})

    dev_folder = Path(FOLDER_PATH) / "dev"
    dev_files = list(dev_folder.glob("*.json"))

    if dev_files:
        build_timeline, function_data = process_day_files(ctx, dev_folder, build_timeline, data, is_dev=True)
    else:
        days_folder = Path(FOLDER_PATH) / "days"
        build_timeline, function_data = process_day_files(ctx, days_folder, build_timeline, data)

    # create function
    day_durarion = 24000 * TICK_FACTOR
    ctx.data["gm4_timelines:register/days"] = Function([
        "# register days",
        "# generated from generate.py",
        "",
        f'data modify storage gm4_timelines:data day_duration set value {day_durarion}',
        f'data modify storage gm4_timelines:data day_registry set value {function_data}',
    ])

    return build_timeline



def process_day_files(
        ctx: Context,
        folder_path: Path,
        build_timeline: TimelineData,
        data: TimelineData,
        is_dev: bool = False
        ) -> Tuple[TimelineData, list[Any]]:
    """
    """
    function_data: list[Any] = []

    for file_path in folder_path.glob("*.json"):
        with file_path.open("r", encoding="utf-8") as f:
            day_data_dict = json.load(f)
        day_data = DayData(**day_data_dict)

        moon_phases = day_data.settings['moon_phase']

        for moon_phase in moon_phases:
            day_build, functions = register_day(ctx, data, day_data, moon_phase)
            build_timeline = append_to_timeline(build_timeline, day_build)

            function_data.append({
                "moon_phase": moon_phase,
                "in_type": day_data.settings['in_type'],
                "out_type": day_data.settings['out_type'],
                "weight": day_data.settings['weight'],
                "start_time": build_timeline.period_ticks,
                "functions": functions,
                "dev": is_dev
            })

            build_timeline.period_ticks += day_build.period_ticks

    return build_timeline, function_data



def register_day(
        ctx: Context,
        default_data: TimelineData,
        day_data: DayData,
        moon_phase: str
        ) -> Tuple[TimelineData, List[Dict[str, Any]]]:
    """
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
    slime_values = {
        "full_moon": 0.5,
        "waning_gibbous": 0.375,
        "third_quarter": 0.25,
        "waning_crescent": 0.125,
        "new_moon": 0,
        "waxing_crescent": 0.125,
        "first_quarter": 0.25,
        "waxing_gibbous": 0.375,
    }
    slime_value = slime_values.get(moon_phase, 0.0)
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

        if entry.functions != []:
            functions.append({"tick":ticks,"functions":entry.functions})

        for effect_name, value in effects.items():
            track_name = f"minecraft:{effect_name}"
            seen_tracks.add(track_name)

            track = result.tracks.get(track_name)
            if not track:
                default_track = default_data.tracks.get(track_name)
                track = Track(
                    keyframes=[],
                    modifier=default_track.modifier if default_track else None,
                    ease=copy.deepcopy(default_track.ease) if default_track else None
                )
                result.tracks[track_name] = track

            track.keyframes.append(Keyframe(ticks=ticks, value=copy.deepcopy(value)))

    # Copy over untouched default tracks
    for track_name, track_data in default_data.tracks.items():
        if track_name not in seen_tracks:
            result.tracks[track_name] = copy.deepcopy(track_data)

    return result, functions


def append_to_timeline(build_timeline: TimelineData, new_data: TimelineData) -> TimelineData:
    """
    """
    offset = build_timeline.period_ticks

    for track_name, src_track in new_data.tracks.items():
        dst_track = build_timeline.tracks.get(track_name)

        if not dst_track:
            dst_track = Track(
                keyframes=[],
                modifier=src_track.modifier,
                ease=copy.deepcopy(src_track.ease)
            )
            build_timeline.tracks[track_name] = dst_track

        for kf in src_track.keyframes:
            dst_track.keyframes.append(
                Keyframe(ticks=kf.ticks + offset, value=copy.deepcopy(kf.value))
            )

    return build_timeline
