#initial functions
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_altar] if entity @s[tag=gm4_altar.ritual.thunder.init]
#called by rituals:altar/ritual/clear_weather/checks

#audiovisuals
playsound minecraft:entity.zombie_villager.converted player @a[distance=..20] ~ ~ ~ 100 0 1

#guardian
summon minecraft:guardian ~ ~1 ~ {Tags:["gm4_altar.ritual.guardian"],Attributes:[{Name:"generic.knockbackResistance",Base:1.0d}],ActiveEffects:[{Id:14b,Duration:999999,Amplifier:0b,ShowParticles:0b}],DeathLootTable:"minecraft:empty",Team:"gm4_rit_no_coll",CustomName:'"gm4_altar.ritual.guardian"',Invulnerable:1b,NoGravity:1b,Silent:1b}

#start timer
scoreboard players add @s gm4_rit_r_clwe 1

#destroy block
setblock ~ ~ ~ minecraft:air destroy

#remove stock
scoreboard players remove $wither_skeleton gm4_rit_stock 2

#tags
tag @s add gm4_altar.ritual.clear_weather
tag @s remove gm4_altar.ritual.clear_weather.init
