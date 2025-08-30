# upgrades and then kills legacy lilyPadLight
# @s = old block display, tag=lilyPadLight
# at @s align xyz positioned ~.5 ~.02 ~.5
# run from upgrade_paths/3.0

# block_state.Name needed for coral fan and candle type info
data modify storage gm4_llp:temp DisplayType set from entity @s block_state.Name

## Select Type
execute if data entity @s {block_state:{Name:"minecraft:torch"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/torch
execute if data entity @s {block_state:{Name:"minecraft:soul_torch"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/soul_torch
execute if data entity @s {block_state:{Name:"minecraft:redstone_torch"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/redstone_torch
execute if data entity @s {block_state:{Name:"minecraft:lantern"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/lantern
execute if data entity @s {block_state:{Name:"minecraft:soul_lantern"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/soul_lantern
execute if data entity @s {block_state:{Name:"minecraft:cactus_flower"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/cactus_flower
execute if data entity @s {block_state:{Name:"minecraft:spore_blossom"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/spore_blossom

execute if data entity @s block_state.Properties.candles run function gm4_lively_lily_pads:upgrade_paths/3.0/upgrade_candle with storage gm4_llp:temp

execute if data entity @s {block_state:{Name:"minecraft:brain_coral_fan"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/coral_fan with storage gm4_llp:temp
execute if data entity @s {block_state:{Name:"minecraft:bubble_coral_fan"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/coral_fan with storage gm4_llp:temp
execute if data entity @s {block_state:{Name:"minecraft:fire_coral_fan"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/coral_fan with storage gm4_llp:temp
execute if data entity @s {block_state:{Name:"minecraft:horn_coral_fan"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/coral_fan with storage gm4_llp:temp
execute if data entity @s {block_state:{Name:"minecraft:tube_coral_fan"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/coral_fan with storage gm4_llp:temp

execute if data entity @s {block_state:{Name:"minecraft:dead_brain_coral_fan"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/dead_coral_fan with storage gm4_llp:temp
execute if data entity @s {block_state:{Name:"minecraft:dead_bubble_coral_fan"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/dead_coral_fan with storage gm4_llp:temp
execute if data entity @s {block_state:{Name:"minecraft:dead_fire_coral_fan"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/dead_coral_fan with storage gm4_llp:temp
execute if data entity @s {block_state:{Name:"minecraft:dead_horn_coral_fan"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/dead_coral_fan with storage gm4_llp:temp
execute if data entity @s {block_state:{Name:"minecraft:dead_tube_coral_fan"}} run function gm4_lively_lily_pads:mechanics/interactions/placement/dead_coral_fan with storage gm4_llp:temp

# kill old
kill @s
