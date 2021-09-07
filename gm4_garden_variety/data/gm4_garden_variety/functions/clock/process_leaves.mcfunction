schedule function gm4_garden_variety:clock/process_leaves 16t

# execute as all sapling leaves
execute as @e[type=marker,tag=gm4_gv_sapling_leaf] at @s at @s align xyz run function gm4_garden_variety:mechanics/sapling_leaves/clock

# fruit leaves
execute as @e[type=armor_stand,tag=gm4_apple_fruit_leaf] at @s align xyz run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/apple/process
execute as @e[type=armor_stand,tag=gm4_red_berry_fruit_leaf] at @s align xyz run function gm4_garden_variety:mechanics/integration/fruiting_trees/fruit_leaves/red_berry/process
