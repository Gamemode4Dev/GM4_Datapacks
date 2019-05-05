execute unless entity @s[nbt={Inventory:[{Slot:103b,tag:{gm4_scuba_gear:{item:"helmet"}}},{Slot:102b,tag:{gm4_scuba_gear:{item:"tank"}}}]}] run function scuba_gear:remove_effect
execute at @s unless block ~ ~1 ~ water unless block ~ ~1 ~ #scuba_gear:water_loggable[waterlogged=true] unless block ~ ~1 ~ #scuba_gear:seagrass run function scuba_gear:remove_effect
