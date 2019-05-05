#ritual activation checks
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_altar]
#called by #rituals:ritual_checks

#check conditions
execute if entity @s[tag=gm4_altar.water] if score $drowned gm4_rit_stock matches 2.. if block ~ ~ ~ #rituals:altar/ritual/rain run function rituals:altar/ritual/rain/init

#functionality
execute if score @s gm4_rit_r_rain matches 1.. run scoreboard players add @s gm4_rit_r_rain 1
execute if score @s gm4_rit_r_rain matches 15 run playsound minecraft:entity.guardian.attack player @a[distance=..20] ~ ~ ~ 100 1 1
execute if score @s gm4_rit_r_rain matches 25.. run function rituals:altar/ritual/rain/run
