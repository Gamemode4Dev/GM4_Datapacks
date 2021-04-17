# age fruiting leaves
execute as @e[type=armor_stand,tag=gm4_fruiting_leaf] run function gm4_fruiting_trees:tree/leaf/fruiting/age

schedule function gm4_fruiting_trees:main 60s
