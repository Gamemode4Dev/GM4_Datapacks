# age fruiting leaves
execute as @e[type=armor_stand,tag=gm4_fruiting_leaf] run function gm4_fruiting_trees:tree/leaf/fruiting/age

# entity versioning
execute as @e[type=armor_stand,tag=gm4_fruiting_leaf,tag=!smithed.entity] run function gm4_fruiting_trees:upgrade_path/smithed_compat
execute as @e[type=marker,tag=gm4_fruiting_sapling,tag=!smithed.entity] run function gm4_fruiting_trees:upgrade_path/smithed_compat

schedule function gm4_fruiting_trees:main 60s
