# Sets temp.data for flower/set_displays
# @s = temp entity inside flower pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {id, display_number, rotation}
# run from flower/set_displays and flower/prepare_data

$data modify storage gm4_blossoming_pots:flower_pots temp.data set value {\
  view_range:0.7935f,\
  Tags:["gm4_blossoming_pots.display.flower_pot","gm4_blossoming_pots.display.flower_pot.$(display_number)","smithed.entity"],\
  Rotation:[$(rotation)f,0f],\
  data:{gm4_blossoming_pots:{Item:{id:"$(id)"}}}\
}
# count set as one so that legacy displays can have higher counts respected in the flower/cleanup function
$data modify storage gm4_blossoming_pots:flower_pots temp.data merge from storage gm4_blossoming_pots:flower_pots $(id).display[$(display_number)]
