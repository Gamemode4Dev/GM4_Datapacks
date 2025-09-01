# placement decision
# @s = placement rcd
# at @s
# run from mechanics/interactions/placement/interact_rcd

# clean
data remove entity @s interaction

# fail if adventure
execute if score $adventure gm4_llp.data matches 1 run return run scoreboard players reset $adventure gm4_llp.data

# select type
execute if score $item_type gm4_llp.data matches 1 run function gm4_lively_lily_pads:mechanics/interactions/placement/coral_fan with storage gm4_llp:temp
execute if score $item_type gm4_llp.data matches 2 run function gm4_lively_lily_pads:mechanics/interactions/placement/dead_coral_fan with storage gm4_llp:temp
execute if score $item_type gm4_llp.data matches 3 run function gm4_lively_lily_pads:mechanics/interactions/placement/torch
execute if score $item_type gm4_llp.data matches 4 run function gm4_lively_lily_pads:mechanics/interactions/placement/lantern
execute if score $item_type gm4_llp.data matches 5 run function gm4_lively_lily_pads:mechanics/interactions/placement/soul_torch
execute if score $item_type gm4_llp.data matches 6 run function gm4_lively_lily_pads:mechanics/interactions/placement/soul_lantern
execute if score $item_type gm4_llp.data matches 7 run function gm4_lively_lily_pads:mechanics/interactions/placement/candles with storage gm4_llp:temp
execute if score $item_type gm4_llp.data matches 8 run function gm4_lively_lily_pads:mechanics/interactions/placement/cactus_flower
execute if score $item_type gm4_llp.data matches 9 run function gm4_lively_lily_pads:mechanics/interactions/placement/redstone_torch
execute if score $item_type gm4_llp.data matches 10 run function gm4_lively_lily_pads:mechanics/interactions/placement/spore_blossom

# set flag
scoreboard players set $placement_success gm4_llp.data 1

# remove placement rcd
kill @s
