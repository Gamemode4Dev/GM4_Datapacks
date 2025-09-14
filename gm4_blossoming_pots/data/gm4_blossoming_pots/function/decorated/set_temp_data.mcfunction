# Sets temp.data for decorated/set_displays
# @s = temp entity inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {id, count, display_number, rotation}
# run from decorated/set_displays

$data modify storage gm4_blossoming_pots:decorated_pots temp.data set value {\
  view_range:0.7935f,\
  Tags:["gm4_blossoming_pots.display.decorated_pot","gm4_blossoming_pots.display.decorated_pot.$(display_number)","smithed.entity","smithed.strict"],\
  Rotation:[$(rotation)f,0f]\
}
$data modify storage gm4_blossoming_pots:decorated_pots temp.data merge from storage gm4_blossoming_pots:decorated_pots $(id).$(count)[$(display_number)]
