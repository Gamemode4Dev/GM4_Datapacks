execute unless entity @s[nbt={Inventory:[{Slot:103b,tag:{gm4_scuba_gear:{item:"helmet"}}},{Slot:102b,tag:{gm4_scuba_gear:{item:"tank"}}}]}] run function gm4_scuba_gear:remove_effect
execute at @s unless block ~ ~1 ~ water unless block ~ ~1 ~ #gm4_scuba_gear:water_loggable[waterlogged=true] unless block ~ ~1 ~ #gm4_scuba_gear:seagrass run function gm4_scuba_gear:remove_effect
