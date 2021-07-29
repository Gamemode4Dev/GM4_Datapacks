#@s = water tank with one stained glass in the first slot
#run from wash

scoreboard players set $item_value gm4_lt_value -1
data modify storage gm4_liquid_tanks:temp/tank output set from storage gm4_liquid_tanks:temp/tank input_slot
data modify storage gm4_liquid_tanks:temp/tank output.id set value glass
function gm4_liquid_tanks:smart_item_fill
tag @s add gm4_lt_fill
