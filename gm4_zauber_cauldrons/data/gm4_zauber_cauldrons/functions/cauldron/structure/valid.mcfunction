# @s = boiling cauldron with valid structure
# at @s align xyz
# run from cauldron/structure/validate/heatsource

# tag this cauldron for future refrence
tag @s add gm4_current_zauber_cauldron

# particles
execute if score $has_water gm4_zc_data matches 1 run particle minecraft:poof ~.5 ~.5 ~.5 .005 .2 .005 .0005 4
execute if score $has_powder_snow gm4_zc_data matches 1 run particle minecraft:dripping_water ~.5 ~0.88 ~.5 0.14 0 0.14 1 1

# count items in cauldron
scoreboard players set @s gm4_zc_fullness 0
data remove storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items
execute as @e[type=item,dx=0,dy=0,dz=0] run function gm4_zauber_cauldrons:cauldron/structure/register_items

# check for recipes if at least one item is found inside
execute if score @s gm4_zc_fullness matches 1.. run function gm4_zauber_cauldrons:cauldron/recipe_checks

# reset
tag @s remove gm4_current_zauber_cauldron
