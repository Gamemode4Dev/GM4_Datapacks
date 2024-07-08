# run from gm4_standard_liquids:item_fill
# @s = tank being processed

scoreboard players set $item_value gm4_lt_value -3
item replace entity 344d47-4-4-4-f04ce104d weapon.mainhand with water_bucket 1
function gm4_liquid_tanks:smart_item_fill
tag @s add gm4_lt_fill
