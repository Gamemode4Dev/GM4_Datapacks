#> gm4_player_motion:internal/launch/main
##
# Launches players along the internal launch vector
#
# @returns (1)
##

## 
# Apply dummy saddle with `apply_impulse` enchantment to player
# 
# Per Smithed specification, the dummy saddle can be unconditionally placed in a player's saddle slot because it will always be empty.
##
item replace entity @s saddle with saddle[\
    equippable={slot: "saddle", equip_sound: "intentionally_empty"}, \
    enchantments={"gm4_player_motion:internal/apply_impulse": 1} \
]

## Convert the internal launch vector from scores into a binary score tree for use by `apply_impulse` enchantment
function gm4_player_motion:internal/store/x
function gm4_player_motion:internal/store/y
function gm4_player_motion:internal/store/z

## Instantly trigger the `location_changed` launch by updating the player's world state

## Record current gamemode to restore after launch
execute if entity @s[gamemode=survival] run scoreboard players set #mode gm4_player_motion.internal.gamemode 2
execute if entity @s[gamemode=adventure] run scoreboard players set #mode gm4_player_motion.internal.gamemode 3

## If not in creative mode, swap into spectator mode
execute if score #mode gm4_player_motion.internal.gamemode matches 2..3 run gamemode spectator

## If not in creative mode, restore gamemode, successful `gamemode` execution result is always `1`
execute if score #mode gm4_player_motion.internal.gamemode matches 2 \
    store success score #mode gm4_player_motion.internal.gamemode run \
    return run gamemode survival
execute if score #mode gm4_player_motion.internal.gamemode matches 3 \
    store success score #mode gm4_player_motion.internal.gamemode run \
    return run gamemode adventure

## Player is in creative mode

## If the player is falling, swap into adventure mode, else, swap into spectator mode
scoreboard players set #falling gm4_player_motion.internal.gamemode 0
execute if predicate gm4_player_motion:internal/falling_creative_player \
    store success score #falling gm4_player_motion.internal.gamemode run gamemode adventure
execute if score #falling gm4_player_motion.internal.gamemode matches 0 run gamemode spectator

## Restore gamemode, successful `gamemode` execution result is always `1`
return run gamemode creative
