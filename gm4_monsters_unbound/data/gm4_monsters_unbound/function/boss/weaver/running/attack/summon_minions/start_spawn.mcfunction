
execute unless block ~ ~ ~ #minecraft:air unless block ~ ~ ~ #minecraft:wither_immune run fill ~ ~ ~ ~ ~ ~ air destroy 
execute summon item_display run function gm4_monsters_unbound:boss/watchers/running/attack/summon_minions/init_spawn
scoreboard players set @s gm4_mu_boss.tick_delay 1
