# Beet Timeline Module

This documentation assumes you know how to build modules with `beet`. If not, an explanation can be found in the [Getting Started guide](https://github.com/Gamemode4Dev/GM4_Datapacks/blob/master/docs/getting-started.md).

The point of the module is to make defining days as easy as possible, so any formatting is up to change if it would make defining days easier.

> **Note:** You need to relog every time you make changes to the timeline.

## Day Definition Format

Days are defined using custom JSON. Every day has its own JSON file that determines how the day looks and when it can be selected. Below is an example with an explanation of each entry.

A full list of environment attributes and their effects can be found on the [wiki](https://minecraft.wiki/w/Environment_attribute), but be aware that some are not meant to be used in day definitions. You can look at `default_day.json` to see which definitions are able to be changed.

```json
{
    "settings": {
        "weight": 1,
        "moon_phase": [
            "full_moon",
            "waning_gibbous",
            "third_quarter",
            "waning_crescent",
            "new_moon",
            "waxing_crescent",
            "first_quarter",
            "waxing_gibbous"
        ],
        "in_type": "clear",
        "out_type": "clear"
    },
    "schedule": [
        {
            "time": 0,
            "effects": {
                "visual/sun_angle": 0,
                "visual/moon_angle": 180,
                "visual/star_angle": 0,
                "visual/star_brightness": 0,
                "visual/sky_light_factor": 1,
                "visual/sky_light_color": "#fffedd",
                "visual/sky_color": "#3888f0",
                "visual/sunrise_sunset_color": "#00ffaa88",
                "visual/fog_color": "#cbfdf2",
                "visual/fog_end_distance": 500,
                "visual/fog_start_distance": 50,
                "visual/sky_fog_end_distance": 0.25,
                "visual/cloud_color": "#00ffffff",
                "visual/cloud_fog_end_distance": 0,
                "visual/cloud_height": 1.5
            },
            "functions": [
                "weather/rain"
            ]
        },
        {
            "time": 5000,
            "effects": {
                "visual/sunrise_sunset_color": "#00ffaa88"
            }
        }
    ]
}
```

### `settings`

| Field | Description |
|---|---|
| `weight` | How common this day is compared to other possible days. Higher weights show up more often. |
| `moon_phase` | Supported moon phases for this day. If a moon phase is not in this list, the day will not be picked. Useful for e.g. a blood moon that should only take place during a full moon. |
| `in_type` | How the start of the day looks. This can be any string, but it must match the `out_type` of the previous day. |
| `out_type` | How the end of the day looks. This can be any string, but it must match the `in_type` of the next day. |

### `schedule`

A list of times that determines the environment attributes.

| Field | Description |
|---|---|
| `time` | The time at which the attributes should be at this point. Time goes from `0` to `23999`, where `0` is noon. |
| `effects` | The environment attributes at this time. Any environment attributes not specified in the schedule will use their default values. |
| `functions` | Any custom functions that should be run. These need to be added on the datapack side, e.g. `weather/rain` or `weather/clear` to change the weather. |

## Datapack Layout

| Path | Description |
|---|---|
| `default_day.json` | How a default day would look if the full schedule is specified. This isn't used anywhere but can be used as a reference. |
| `default_day_simple.json` | Same as above, but without some uncommon tracks like villager activity. |
| `raw_data/default.json` | Default specification used by the datapack. This shouldn't be changed / used. |
| `raw_data/days/...` | Add day definitions here. |
| `raw_data/dev/...` | If days are specified in this folder, they will be built instead of the days folder. Useful if you want to test a day in game. |
