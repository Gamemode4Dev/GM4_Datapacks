# @s = player placing an armor_stand
# at @s
# run from advancement place

advancement revoke @s only gm4_better_armour_stands:place

# add arms to new armor_stand and remove randomness. tag= matches armor stands with no existing tags
execute positioned ^ ^ ^3 as @e[type=armor_stand,tag=,distance=..3] run function gm4_better_armour_stands:place/new

# copy exact pose from copied armor_stand item to remove randomness
execute as @e[type=armor_stand,tag=gm4_bas_copy,distance=..6,limit=1] run function gm4_better_armour_stands:place/copy
