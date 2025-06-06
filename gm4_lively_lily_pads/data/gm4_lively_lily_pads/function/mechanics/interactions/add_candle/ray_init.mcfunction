# set up raycast
# @s = player
# at @s
# with {str_len}
# run from mechanincs/interactions/add_candle/interact_rcd

# string manipulation step 2
$data modify storage gm4_llp:temp string set string storage gm4_llp:temp SelectedItem 10 $(str_len)
# ray
execute anchored eyes positioned ^ ^ ^ run function gm4_lively_lily_pads:mechanics/interactions/add_candle/ray with storage gm4_llp:temp
