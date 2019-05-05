execute as @e[type=mooshroom] at @s unless entity @s[tag=gm4_shroomite_barren] if block ~ ~ ~ #shroomites:shroom_rootable unless entity @e[tag=gm4_shroomite_shroom,type=area_effect_cloud,distance=..5] run function shroomites:shroom_shed

#resets after the funtion ran
tag @e[type=mooshroom] remove gm4_shroomite_barren
scoreboard players set gm4_shroom_countdown gm4_shroom_time 0
