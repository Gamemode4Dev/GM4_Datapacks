schedule function gm4_garden_variety:clock/process_saplings 5s

# execute as all sapling leaves
execute as @e[type=marker,tag=gm4_gv_sapling] at @s at @s align xyz run function gm4_garden_variety:mechanics/custom_sapling/mutations/clock
