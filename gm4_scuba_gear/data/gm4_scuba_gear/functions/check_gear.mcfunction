execute unless entity @s[predicate=gm4_scuba_gear:tank_equipped] run function gm4_scuba_gear:remove_effect
execute at @s unless block ~ ~1 ~ water unless block ~ ~1 ~ #gm4_scuba_gear:water_loggable[waterlogged=true] unless block ~ ~1 ~ #gm4_scuba_gear:seagrass run function gm4_scuba_gear:remove_effect
