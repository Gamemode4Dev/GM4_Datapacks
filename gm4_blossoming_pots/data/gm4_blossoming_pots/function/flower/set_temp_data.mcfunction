# sets temp.data for the loop
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with storage gm4_blossoming_pots:flower_pots temp
# run from flower/loop and flower/as_marker

$data modify storage gm4_blossoming_pots:flower_pots temp.data set from storage gm4_blossoming_pots:flower_pots $(id).$(count)[$(score)]
