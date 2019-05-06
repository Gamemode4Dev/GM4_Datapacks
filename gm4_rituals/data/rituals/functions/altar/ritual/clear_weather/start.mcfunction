#initial functions
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_rituals_altar] if entity @s[tag=gm4_rituals_ritual_thunder_start]
#called by rituals:altar/ritual/clear_weather/checks

#audiovisuals
playsound minecraft:entity.zombie_villager.converted player @a[distance=..20] ~ ~ ~ 100 0 1

#start timer
scoreboard players add @s gm4_rit_clear 1

#destroy block
setblock ~ ~ ~ minecraft:air destroy

#remove stock
scoreboard players remove $wither_skeleton gm4_rit_stock 2
