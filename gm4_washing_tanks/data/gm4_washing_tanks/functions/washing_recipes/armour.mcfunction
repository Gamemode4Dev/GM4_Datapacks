#@s = water tank with one leather armour in the first slot
#run from wash

scoreboard players set $item_value gm4_lt_value -1

data modify storage gm4_liquid_tanks:temp/tank output set from storage gm4_liquid_tanks:temp/tank input_slot

data remove storage gm4_liquid_tanks:temp/tank output.tag.display.color
# does not requre clearing of display compound because armor cannot stack anyway

function gm4_liquid_tanks:smart_item_fill
tag @s add gm4_lt_fill
