# run from gm4_standard_liquids:item_fill
# @s = tank being processed

scoreboard players set $item_value gm4_lt_value -1
data merge storage gm4_liquid_tanks:temp/tank {output:{id:"mushroom_stew"}}
function gm4_liquid_tanks:smart_item_fill
tag @s add gm4_lt_fill
