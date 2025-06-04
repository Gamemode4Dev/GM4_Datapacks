# placement decision
# @s = placement rcd
# at @s   (lily_pad align xyz positioned ~.5 ~.1 ~.5)
# run from mechanics/interactions/placement/ray

execute if score $item_type gm4_llp.data matches 1..2 run function gm4_lively_lily_pads:mechanics/interactions/placement/coral_fan with storage gm4_llp:temp
execute if score $item_type gm4_llp.data matches 3..4 run function gm4_lively_lily_pads:mechanics/interactions/placement/light_14 with storage gm4_llp:temp
execute if score $item_type gm4_llp.data matches 5..6 run function gm4_lively_lily_pads:mechanics/interactions/placement/light_9 with storage gm4_llp:temp
execute if score $item_type gm4_llp.data matches 7 run function gm4_lively_lily_pads:mechanics/interactions/placement/candles with storage gm4_llp:temp
execute if score $item_type gm4_llp.data matches 8 run function gm4_lively_lily_pads:mechanics/interactions/placement/cactus_flower
execute if score $item_type gm4_llp.data matches 9 run function gm4_lively_lily_pads:mechanics/interactions/placement/redstone_torch
execute if score $item_type gm4_llp.data matches 10 run function gm4_lively_lily_pads:mechanics/interactions/placement/spore_blossom

# set minus_one
scoreboard players set $minus_one gm4_llp.data 1

# remove placement rcd
kill @s
