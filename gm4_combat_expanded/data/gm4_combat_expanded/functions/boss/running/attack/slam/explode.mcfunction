
scoreboard players set $raycast gm4_ce_boss -1
summon dragon_fireball ~ ~-0.4 ~ {power:[0.0,-3.0,0.0],Tags:["gm4_ce_boss","gm4_ce_boss.slam_explosion"]}
execute positioned ~-1.5 ~-1 ~-1.5 as @a[gamemode=!spectator,gamemode=!creative,dx=2,dy=17.5,dz=2] run function gm4_combat_expanded:boss/running/attack/slam/explode_damage
