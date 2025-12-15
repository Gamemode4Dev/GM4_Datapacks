from beet import Context
from pathlib import Path
import json
from typing import cast, Dict, Any
from beet import Context, JsonFile, NamespaceFileScope
from typing import TypedDict, ClassVar, Dict, List, Any

TICK_FACTOR_VANILLA: int = 30
TICK_OFFSET_VANILLA: int = 12000 # <- set to 30, we don't offset
TICK_FACTOR_CUSTOM: int = 300
FOLDER_PATH: str = "gm4_timelines/raw_data/"

class Keyframe(TypedDict):
    ticks: int
    value: Any

class Track(TypedDict, total=False):
    keyframes: List[Keyframe]
    modifier: str

class TimelineData(TypedDict):
    period_ticks: int
    tracks: Dict[str, Track]

class Timeline(JsonFile):
    scope: ClassVar[NamespaceFileScope] = ("timeline",)
    extension: ClassVar[str] = ".json"


def beet_default(ctx: Context) -> None:
    ctx.data.extend_namespace += [Timeline]

    vanilla_folder: Path = Path(FOLDER_PATH + "vanilla")

    for file_path in vanilla_folder.glob("*.json"):
        with file_path.open("r", encoding="utf-8") as f:
            data: TimelineData = json.load(f)
        factor_ticks(ctx, file_path.stem, data)


def factor_ticks(ctx: Context, name: str, data: TimelineData) -> None:
    tick_factor: int = TICK_FACTOR_VANILLA
    tick_offset: int = TICK_OFFSET_VANILLA
    period: int = data["period_ticks"]

    data["period_ticks"] = period * tick_factor

    tracks: Dict[str, Track] = data.get("tracks", {})
    for track in tracks.values():
        for kf in track.get("keyframes", []):
            if "ticks" in kf:
                kf["ticks"] = ((kf["ticks"] + tick_offset) % period) * tick_factor

    if name == "day":
        data = register_days(ctx, data)

    ctx.data[f"minecraft:{name}"] = Timeline(
        cast(Dict[str, Any], data)
    )


def register_days(ctx: Context, data: TimelineData) -> TimelineData:
    days_folder: Path = Path(FOLDER_PATH + "days")

    build_timeline: TimelineData = {
        "period_ticks": data["period_ticks"],
        "tracks": {},
    }

    current_offset: int = 0

    for file_path in days_folder.glob("*.json"):
        with file_path.open("r", encoding="utf-8") as f:
            day_data: TimelineData = json.load(f)

        day_build: TimelineData = add_day(data, day_data)
        day_period: int = day_build["period_ticks"]

        for track_name, day_track in day_build["tracks"].items():
            default_track: Track = {}
            for k, v in day_track.items():
                if k != "keyframes":
                    default_track[k] = v
            out_track = build_timeline["tracks"].setdefault(track_name, default_track)

            out_kfs: List[Keyframe] = out_track.setdefault("keyframes", [])

            for kf in day_track.get("keyframes", []):
                out_kfs.append({
                    "ticks": kf["ticks"] + current_offset,
                    "value": kf["value"],
                })

        current_offset += day_period * 8

    build_timeline["period_ticks"] = current_offset

    for track in build_timeline["tracks"].values():
        if "keyframes" in track:
            track["keyframes"].sort(key=lambda k: k["ticks"])

    return build_timeline


def add_day(default_data: TimelineData, day_data: TimelineData) -> TimelineData:
    period: int = default_data["period_ticks"]

    out: TimelineData = {
        "period_ticks": period,
        "tracks": {},
    }

    base_tracks: Dict[str, Track] = default_data.get("tracks", {})
    override_tracks: Dict[str, Track] = day_data.get("tracks", {})

    tick_factor: int = TICK_FACTOR_CUSTOM

    for track in override_tracks.values():
        for kf in track.get("keyframes", []):
            if "ticks" in kf:
                kf["ticks"] *= tick_factor

    for name in base_tracks.keys() | override_tracks.keys():
        src: Track = override_tracks.get(name) or base_tracks[name]

        out_track: Track = {}
        out["tracks"][name] = out_track

        for k, v in src.items():
            if k != "keyframes":
                out_track[k] = v

        keyframes: List[Keyframe] = src.get("keyframes", [])
        out_kfs: List[Keyframe] = []
        out_track["keyframes"] = out_kfs

        for i in range(8):
            offset: int = i * period
            for kf in keyframes:
                out_kfs.append({
                    "ticks": kf["ticks"] + offset,
                    "value": kf["value"],
                })

        out_kfs.sort(key=lambda k: k["ticks"])

    return out
