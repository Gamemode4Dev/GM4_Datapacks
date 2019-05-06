#ritual activation checks
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_rituals_altar]
#called by #rituals:ritual_checks

#check conditions
execute unless score @s gm4_rit_rain matches 1.. if entity @s[tag=gm4_rituals_altar_water] if score $drowned gm4_rit_stock matches 2.. if block ~ ~ ~ #rituals:altar/ritual/rain run function rituals:altar/ritual/rain/start

#functionality
execute if score @s gm4_rit_rain matches 1.. run scoreboard players add @s gm4_rit_rain 1
execute if score @s gm4_rit_rain matches 15 run playsound minecraft:entity.guardian.attack player @a[distance=..20] ~ ~ ~ 100 1 1
execute if score @s gm4_rit_rain matches 25.. run function rituals:altar/ritual/rain/finish
