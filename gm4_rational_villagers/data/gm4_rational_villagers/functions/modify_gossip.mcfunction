
# modify value of gossip
execute if data storage gm4_rational_villagers:temp/villager Modify{Type:"major_positive"} if score value gm4_rv_trade matches 6.. run scoreboard players set value gm4_rv_trade 5
execute if data storage gm4_rational_villagers:temp/villager Modify{Type:"minor_positive"} if score value gm4_rv_trade matches 81.. run scoreboard players set value gm4_rv_trade 80
execute store result storage gm4_rational_villagers:temp/villager Modify.Value int 1 run scoreboard players get value gm4_rv_trade
