# run from gm4_zauber_liquids:item_fill
# @s = tank being processed

# $item_value set in item_fill function for efficiency

loot replace entity @s weapon.mainhand loot gm4_zauber_cauldrons:recipes/potions/drinkable/poison
data modify storage gm4_liquid_tanks:temp/tank output set from entity @s HandItems[0]
item replace entity @s weapon.mainhand with air
function gm4_liquid_tanks:smart_item_fill
tag @s add gm4_lt_fill
