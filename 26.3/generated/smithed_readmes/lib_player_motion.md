# lib_player_motion
The [Player Motion](https://modrinth.com/datapack/player_motion) library prefixed with the GM4 namespace and properly versioned to prevent conflicts with other versions of player motion.

## changes
The following usage changes have been made to the original player motion library:
- The scoreboard objective `gm4_player_motion.api.launch` should be used instead of `player_motion.api.launch` when setting the parameters for the launch.
- The function tags `#gm4_player_motion:launch_xyz` and `#gm4_player_motion:launch_looking` function tags should be used instead of the `player_motion:api/launch_xyz` and `player_motion:api/launch_looking` functions.

The following file changes have been made to the original player motion library:
- The `#minecraft:load` function tag has been removed in favor of lantern load.
- The `player_motion` namespace has been changed to `gm4_player_motion` to prevent potential conflicts with other versions of the player motion library.
- The `player_motion:internal/technical/load` function has been moved to `gm4_player_motion:load` as per GM4 file conventions.
- The `#gm4_player_motion:launch_xyz` and `#gm4_player_motion:launch_looking` functions tags have been added as version-checked API calls.

The following implementation changes have been made to the original player motion library:
- All scoreboard objectives and storage references use `gm4_player_motion` instead of `player_motion` to prevent potential conflicts with other versions of the player motion library.
- The UUID for the marker used to get vectors has been changed to a different UUID to prevent potential conflicts with other versions of the player motion library.
- The marker is kept at 29999998 0 7133 instead of 0 0 0 to prevent forceloading 0 0; instead the GM4 forceloaded chunk is used to keep the marker selectable.
