execute unless entity @s[predicate=gm4_scuba_gear:tank_equipped] run function gm4_scuba_gear:remove_effect
execute at @s unless block ~ ~1 ~ #gm4:water unless block ~ ~1 ~ #gm4:waterloggable[waterlogged=true] run function gm4_scuba_gear:remove_effect
