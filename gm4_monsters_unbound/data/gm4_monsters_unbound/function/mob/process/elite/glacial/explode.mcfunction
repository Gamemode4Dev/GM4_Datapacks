
scoreboard players set $freeze_seconds gm4_mu_data 3
execute as @e[distance=..4.81] run function gm4_monsters_unbound:effect/freeze/apply
execute as @a[gamemode=!spectator,distance=..12] facing entity @s eyes positioned ^ ^ ^4.5 positioned ~-.05 ~-.05 ~-.05 if entity @s[dx=0,dy=0,dz=0] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0,dy=0,dz=0] run function gm4_monsters_unbound:effect/freeze/apply
playsound block.glass.break hostile @a[distance=..4.81] ~ ~ ~ 1 0.8

kill @s
