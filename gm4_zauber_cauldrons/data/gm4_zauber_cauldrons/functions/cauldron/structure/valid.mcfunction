# @s=boiling cauldron with valid structure
# at @s
# run from cauldron/structure/check

particle poof ~ ~ ~ .005 .2 .005 .0005 4

# count items in Cauldrons
scoreboard players set @s gm4_zc_fullness 0
execute align xyz as @e[type=item,dx=0,dy=0,dz=0] positioned ~.5 ~.5 ~.5 run scoreboard players add @e[type=area_effect_cloud,tag=gm4_zauber_cauldron,distance=..0.1,limit=1] gm4_zc_fullness 1

# check for recipes if structure is valid
execute if score @s gm4_zc_fullness matches 1.. run function gm4_zauber_cauldrons:cauldron/recipe_checks
