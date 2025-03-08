# Sets temp.data for flower/set_displays
# @s = temp entity inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {id, count, display_number}
# run from flower/set_displays and flower/prepare_data

$data modify storage gm4_blossoming_pots:flower_pots temp.data set from storage gm4_blossoming_pots:flower_pots $(id).$(count)[$(display_number)]
