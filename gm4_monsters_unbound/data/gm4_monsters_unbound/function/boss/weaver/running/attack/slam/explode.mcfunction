
scoreboard players set $raycast gm4_mu_boss -1
summon dragon_fireball ~ ~-0.4 ~ {power:[0.0,-3.0,0.0],Tags:["gm4_mu_boss.watcher","gm4_mu_boss.slam_explosion"]}
summon firework_rocket ~ ~-0.4 ~ {Silent:1b,HasVisualFire:1b,LifeTime:0,ShotAtAngle:1b,Motion:[0.0,-2.0,0.0],Tags:["gm4_mu_boss.small_fireball"],FireworksItem:{id:"firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"burst",colors:[I;9570559]},{Type:0,Trail:1b,Colors:[I;9570559]},{shape:"burst",colors:[I;7014075]},{shape:"burst",colors:[I;5637526]},{shape:"burst",colors:[I;3998827]}]}}}}

tag @s add gm4_mu_target
execute positioned ~-2 ~-1 ~-2 as @a[gamemode=!spectator,gamemode=!creative,dx=3,dy=17.5,dz=3] at @e[type=shulker,tag=gm4_mu_target] positioned ~-2 ~-20 ~-2 if entity @s[dx=3,dy=18.5,dz=3] run function gm4_monsters_unbound:boss/watchers/running/attack/slam/explode_damage
tag @s remove gm4_mu_target