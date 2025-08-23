# Sets temp.data for decorated/set_displays
# @s = temp entity inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {id, count, display_number}
# run from decorated/set_displays


$data modify storage gm4_blossoming_pots:decorated_pots temp.data set from storage gm4_blossoming_pots:decorated_pots $(id).$(count)[$(display_number)]
