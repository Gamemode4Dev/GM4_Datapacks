#@s = player with conjuring pneuma who stopped sneaking
#run from pneumas/sneak/stopped

summon armor_stand ~ ~ ~ {Invisible:1b,NoGravity:1b,Marker:1b,Small:1b,CustomName:'"Fang Thrower"',Tags:["gm4_oa_fang_thrower","gm4_oa_new_fang"],ArmorItems:[{id:"minecraft:stick",Count:1b},{},{},{}]}
data modify entity @e[type=minecraft:armor_stand,tag=gm4_oa_new_fang,distance=..0.001,limit=1] ArmorItems[0].tag.gm4_oa_conjuring set from entity @s UUID
tp @e[type=armor_stand,tag=gm4_oa_new_fang,distance=..0.001,limit=1] ~ ~ ~ ~ 0
scoreboard players set @s[scores={gm4_oa_snk_num=3..5}] gm4_pneuma_data 6
scoreboard players set @s[scores={gm4_oa_snk_num=6..8}] gm4_pneuma_data 9
scoreboard players set @s[scores={gm4_oa_snk_num=9..13}] gm4_pneuma_data 12
scoreboard players set @s[scores={gm4_oa_snk_num=14..}] gm4_pneuma_data 15
scoreboard players operation @e[type=armor_stand,tag=gm4_oa_new_fang,distance=..0.001,limit=1] gm4_pneuma_data = @s gm4_pneuma_data
tag @e[type=armor_stand,tag=gm4_oa_new_fang,distance=..0.001,limit=1] remove gm4_oa_new_fang
