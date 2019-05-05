#runs rain ritual
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_altar]
#called by rituals:altar/ritual/thunder/checks

#audiovisuals
playsound minecraft:ambient.underwater.exit player @a[distance=..20] ~ ~ ~ 100 2 1
playsound minecraft:ambient.underwater.exit player @a[distance=..20] ~ ~ ~ 100 1 1
playsound minecraft:ambient.underwater.exit player @a[distance=..20] ~ ~ ~ 100 0 1

particle minecraft:item_snowball ~ ~4 ~ 1 0 1 0 500 normal @a
particle minecraft:poof ~ ~4 ~ 1 0 1 0 500 normal @a

summon minecraft:lightning_bolt ~ ~-.5 ~

#functionality
## clear weather - unspecified time
weather clear

#remove guardian
execute positioned ~ ~1 ~ run data merge entity @e[type=minecraft:guardian,tag=gm4_altar.ritual.guardian,sort=nearest,limit=1] {Health:0.0f,DeathTime:19s}

#reset scores/tags
scoreboard players reset @s gm4_rit_r_clwe
tag @s remove gm4_altar.ritual.clear_weather
