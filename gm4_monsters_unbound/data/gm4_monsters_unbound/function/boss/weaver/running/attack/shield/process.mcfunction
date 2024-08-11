
scoreboard players add @s gm4_mu_boss.attack_progress 1

execute if score @s gm4_mu_boss.attack_progress matches 1 run function gm4_monsters_unbound:boss/watchers/running/health/immune_add

scoreboard players set @s gm4_mu_boss.tick_delay 20
execute if entity @p[gamemode=!spectator,gamemode=!creative,distance=..48] run function gm4_monsters_unbound:boss/watchers/running/attack/shield/end
