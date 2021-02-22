# age fruiting leaves
execute as @e[type=armor_stand,tag=gm4_fruiting_leaf] run function gm4_fruiting_trees:tree/leaf/fruiting/age

# register trades from expansions on wandering traders
execute as @e[type=wandering_trader,tag=!gm4_fruiting_trader,tag=!gm4_no_edit] at @s run function gm4_fruiting_trees:wandering_trader/add_trade

schedule function gm4_fruiting_trees:main 60s
