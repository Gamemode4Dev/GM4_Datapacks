#ritual activation checks
#@s - @e[type=minecraft:area_effect_cloud,tag=gm4_altar]
#called by #rituals:ritual_checks

#check conditions
execute if entity @s[tag=gm4_altar.water] if score $item_trident gm4_rit_stock matches 4.. if score $drowned gm4_rit_stock matches 2.. if block ~ ~ ~ #rituals:altar/ritual/thunder run function rituals:altar/ritual/thunder/init

#functionality
execute if score @s gm4_rit_r_thun matches 1.. run scoreboard players add @s gm4_rit_r_thun 1
execute if score @s gm4_rit_r_thun matches 15 run playsound minecraft:entity.guardian.attack player @a[distance=..20] ~ ~ ~ 100 1 1
execute if score @s gm4_rit_r_thun matches 25.. run function rituals:altar/ritual/thunder/run
