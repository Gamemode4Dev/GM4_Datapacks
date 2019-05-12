#@s = enlarging phantom
#at @s
#called by set_pos

execute store result score @s gm4_menace run data get entity @s UUIDMost 0.00000000023283064365386962890625
scoreboard players operation @s gm4_menace %= 100 gm4_menace

execute if score @s gm4_menace matches ..49 run data merge entity @s {Tags:[],Size:3,Attributes:[{Name:"generic.maxHealth",Base:24.0}]}
execute if score @s gm4_menace matches 50..89 run data merge entity @s {Tags:[],Size:5,Attributes:[{Name:"generic.maxHealth",Base:30.0}]}
execute if score @s gm4_menace matches 90.. run data merge entity @s {Tags:[],Size:7,Attributes:[{Name:"generic.maxHealth",Base:40.0}]}

scoreboard players reset @s gm4_menace