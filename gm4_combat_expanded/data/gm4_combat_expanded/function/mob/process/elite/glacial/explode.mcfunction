
execute as @a[gamemode=!spectator,tag=!gm4_ce_frozen,distance=..4.81] run function gm4_combat_expanded:effect/freeze/apply_player
execute as @a[gamemode=!spectator,tag=!gm4_ce_frozen] facing entity @s eyes positioned ^ ^ ^4.5 positioned ~-.05 ~-.05 ~-.05 if entity @s[dx=0,dy=0,dz=0] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0,dy=0,dz=0] run function gm4_combat_expanded:effect/freeze/apply_player
playsound block.glass.break hostile @a[distance=..4.81] ~ ~ ~ 1 0.8

kill @s
