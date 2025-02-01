# Sets temp.data for flower/set_displays
# @s = temp marker inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {id, count, score}
# run from flower/set_displays and flower/prepare_data

$data modify storage gm4_blossoming_pots:flower_pots temp.data set from storage gm4_blossoming_pots:flower_pots $(id).$(count)[$(score)]
