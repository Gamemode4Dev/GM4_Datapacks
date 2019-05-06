#ritual activation checks
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_rituals_altar]
#called by #rituals:ritual_checks

#check conditions
execute unless score @s gm4_rit_thunder matches 1.. if entity @s[tag=gm4_rituals_altar_water] if score $item_trident gm4_rit_stock matches 4.. if score $drowned gm4_rit_stock matches 2.. if block ~ ~ ~ #rituals:altar/ritual/thunder run function rituals:altar/ritual/thunder/start

#functionality
execute if score @s gm4_rit_thunder matches 1.. run scoreboard players add @s gm4_rit_thunder 1
execute if score @s gm4_rit_thunder matches 15 run playsound minecraft:entity.guardian.attack player @a[distance=..20] ~ ~ ~ 100 1 1
execute if score @s gm4_rit_thunder matches 25.. run function rituals:altar/ritual/thunder/finish
