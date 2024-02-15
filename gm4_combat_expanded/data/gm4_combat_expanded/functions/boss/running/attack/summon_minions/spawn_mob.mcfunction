
execute positioned ~ ~-1.6 ~ summon zombie run function gm4_combat_expanded:boss/running/attack/summon_minions/init_mob
execute unless block ~ ~-1 ~ #gm4:air unless block ~ ~-1 ~ #minecraft:wither_immune run fill ~ ~-1 ~ ~ ~-1 ~ air destroy
kill @s
