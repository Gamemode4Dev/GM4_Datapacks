#runs rain ritual
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_rituals_altar]
#called by rituals:altar/ritual/thunder/checks

#audiovisuals
playsound minecraft:ambient.underwater.exit player @a[distance=..20] ~ ~ ~ 100 2 1
playsound minecraft:ambient.underwater.exit player @a[distance=..20] ~ ~ ~ 100 1 1
playsound minecraft:ambient.underwater.exit player @a[distance=..20] ~ ~ ~ 100 0 1

particle minecraft:item_snowball ~ ~4 ~ 1 0 1 0 500 normal @a
particle minecraft:poof ~ ~4 ~ 1 0 1 0 500 normal @a

summon minecraft:lightning_bolt ~ ~-.5 ~

#functionality
## clear - 3 minutes
weather clear 3600

#reset scores/tags
scoreboard players reset @s gm4_rit_clear
tag @s remove gm4_rituals_ritual_clear_weather
