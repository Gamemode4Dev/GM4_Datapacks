# placement decision
# @s = placement rcd
# lily_pad align xyz positioned ~.5 ~.02 ~.5
# with {str_len}
# run from mechanics/interactions/placement/ray

# string manipulation step 2
$data modify storage gm4_llp:temp string set string storage gm4_llp:temp SelectedItem 10 $(str_len)

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

# set minus_one
scoreboard players set $minus_one gm4_llp.data 1

# remove placement rcd
kill @s
