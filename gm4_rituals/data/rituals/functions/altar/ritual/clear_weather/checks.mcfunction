#ritual activation checks
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_rituals_altar]
#called by #rituals:ritual_checks

#check conditions
execute unless score @s gm4_rit_clear matches 1.. if score $wither_skeleton gm4_rit_stock matches 2.. if block ~ ~ ~ #rituals:altar/ritual/clear_weather run function rituals:altar/ritual/clear_weather/start

#functionality
execute if score @s gm4_rit_clear matches 1.. run scoreboard players add @s gm4_rit_clear 1
execute if score @s gm4_rit_clear matches 15 run playsound minecraft:entity.guardian.attack player @a[distance=..20] ~ ~ ~ 100 1 1
execute if score @s gm4_rit_clear matches 25.. run function rituals:altar/ritual/clear_weather/finish
