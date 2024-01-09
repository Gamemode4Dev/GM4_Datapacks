
# healing pulse effects
scoreboard players set $level gm4_ce_data 3
effect give @e[type=!player,distance=..6.25,tag=!smithed.strict] instant_health 1 2
effect give @a[distance=..6.5] regeneration 2 4
effect give @a[distance=..6.25] instant_health 1 1

# healing pulse particles and sound
playsound minecraft:block.conduit.activate player @a ~ ~ ~ 1 2
execute positioned ~ ~.6 ~ summon marker at @s run function gm4_combat_expanded:armor/modifier/type/soothe/particles
