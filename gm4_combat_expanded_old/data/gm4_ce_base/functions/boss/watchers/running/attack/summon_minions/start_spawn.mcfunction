
execute unless block ~ ~ ~ #gm4:air unless block ~ ~ ~ #minecraft:wither_immune run fill ~ ~ ~ ~ ~ ~ air destroy 
execute summon item_display run function gm4_ce_base:boss/watchers/running/attack/summon_minions/init_spawn
scoreboard players set @s gm4_ce_boss.tick_delay 1
