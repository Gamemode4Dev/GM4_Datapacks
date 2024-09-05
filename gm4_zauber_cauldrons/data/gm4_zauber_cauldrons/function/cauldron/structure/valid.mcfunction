# @s = boiling cauldron with valid structure
# at @s align xyz
# run from cauldron/structure/validate/heatsource

# tag this cauldron for future refrence
tag @s add gm4_current_zauber_cauldron

# count items in cauldron
scoreboard players set @s gm4_zc_fullness 0
data remove storage gm4_zauber_cauldrons:temp/cauldron/ingredients items
execute as @e[type=item,dx=0,dy=0,dz=0] run function gm4_zauber_cauldrons:cauldron/structure/register_items

# pull liquid id and cauldron location into ingredient storage
data modify storage gm4_zauber_cauldrons:temp/cauldron/ingredients marker_data set from entity @s data.gm4_zauber_cauldrons
data modify storage gm4_zauber_cauldrons:temp/cauldron/ingredients liquid set from storage gm4_zauber_cauldrons:temp/cauldron/ingredients marker_data.liquid
data modify storage gm4_zauber_cauldrons:temp/cauldron/ingredients location set from storage gm4_zauber_cauldrons:temp/cauldron/ingredients marker_data.location
data remove storage gm4_zauber_cauldrons:temp/cauldron/ingredients marker_data

# particles
execute if score $has_water gm4_zc_data matches 1 run particle minecraft:poof ~.5 ~.5 ~.5 .005 .2 .005 .0005 4
execute if score $has_powder_snow gm4_zc_data matches 1 run particle minecraft:dripping_water ~.5 ~0.88 ~.5 0.14 0 0.14 1 1
execute if score @s gm4_zc_liquid_level matches 1..3 run function #gm4_zauber_cauldrons:cauldron/liquid/cauldron_particles
scoreboard players reset $displayed_liquid_particle gm4_zc_data

# check for recipes if at least one item is found inside
execute if score @s gm4_zc_fullness matches 1.. positioned ~.5 ~.5 ~.5 run function gm4_zauber_cauldrons:cauldron/recipe_checks

# reset
tag @s remove gm4_current_zauber_cauldron
