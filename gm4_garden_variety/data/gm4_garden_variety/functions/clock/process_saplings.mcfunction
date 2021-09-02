schedule function gm4_garden_variety:clock/process_saplings 60s

# execute as all sapling leaves
execute as @e[type=marker,tag=gm4_gv_sapling] at @s unless score @s gm4_gv_mutations matches 1.. run function gm4_garden_variety:mechanics/custom_sapling/mutations/clock
