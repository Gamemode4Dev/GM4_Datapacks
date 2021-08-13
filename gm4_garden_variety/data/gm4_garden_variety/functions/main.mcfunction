
schedule function gm4_garden_variety:main 16t

# execute as all sapling leaves
execute as @e[type=marker,tag=gm4_gv_sapling_leaf] at @s at @s align xyz run function gm4_garden_variety:markers/sapling_leaf/clock
