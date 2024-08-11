
scoreboard players set $target_found gm4_mu_boss 0
execute as @p[gamemode=!spectator,gamemode=!creative,distance=..18] run function gm4_monsters_unbound:boss/watchers/running/attack/fireball/mark_player_as_target
execute if score $target_found gm4_mu_boss matches 0 run function gm4_monsters_unbound:boss/watchers/running/attack/fireball/cancel
