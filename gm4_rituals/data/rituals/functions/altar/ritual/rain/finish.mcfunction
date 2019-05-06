#runs rain ritual
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_rituals_altar]
#called by rituals:altar/ritual/rain/checks

#audiovisuals
playsound minecraft:ambient.underwater.enter player @a[distance=..20] ~ ~ ~ 100 2 1
playsound minecraft:ambient.underwater.enter player @a[distance=..20] ~ ~ ~ 100 1 1
playsound minecraft:ambient.underwater.enter player @a[distance=..20] ~ ~ ~ 100 0 1

particle minecraft:dripping_water ~ ~4 ~ 1 0 1 0 500 normal @a

summon minecraft:trident ~1 ~3 ~1 {life:1198s,pickup:0b,SoundEvent:"minecraft:item.trident.thunder",Invulnerable:1b}
summon minecraft:trident ~1 ~3 ~-1 {life:1198s,pickup:0b,SoundEvent:"minecraft:item.trident.thunder",Invulnerable:1b}
summon minecraft:trident ~-1 ~3 ~1 {life:1198s,pickup:0b,SoundEvent:"minecraft:item.trident.thunder",Invulnerable:1b}
summon minecraft:trident ~-1 ~3 ~-1 {life:1198s,pickup:0b,SoundEvent:"minecraft:item.trident.thunder",Invulnerable:1b}

summon minecraft:lightning_bolt ~ ~-.5 ~
summon minecraft:lightning_bolt ~1 ~4 ~
summon minecraft:lightning_bolt ~-1 ~4 ~
summon minecraft:lightning_bolt ~ ~4 ~1
summon minecraft:lightning_bolt ~ ~4 ~-1

#functionality
## rain - 3 minutes
weather rain 3600

#reset scores/tags
scoreboard players reset @s gm4_rit_rain
tag @s remove gm4_rituals_ritual_rain
