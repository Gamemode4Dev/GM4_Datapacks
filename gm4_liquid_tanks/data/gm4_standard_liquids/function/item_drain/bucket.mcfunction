# run from gm4_standard_liquids:item_drain
# @s = tank being processed

scoreboard players set $item_value gm4_lt_value 3
item replace entity 344d47-4-4-4-f04ce104d weapon.mainhand with bucket
function gm4_liquid_tanks:smart_item_drain
tag @s add gm4_lt_drain
