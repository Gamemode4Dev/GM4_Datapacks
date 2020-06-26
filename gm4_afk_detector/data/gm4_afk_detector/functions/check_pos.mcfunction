scoreboard players set @s gm4_afk_still 0

#Store Pos
execute store result score @s gm4_afk_x run data get entity @s Pos[0]
execute store result score @s gm4_afk_y run data get entity @s Pos[1]
execute store result score @s gm4_afk_z run data get entity @s Pos[2]

#Check for movment
execute if score @s gm4_afk_x = @s gm4_afk_x1 run scoreboard players add @s gm4_afk_still 1
execute if score @s gm4_afk_y = @s gm4_afk_y1 run scoreboard players add @s gm4_afk_still 1
execute if score @s gm4_afk_z = @s gm4_afk_z1 run scoreboard players add @s gm4_afk_still 1

#Store 2nd Pos
execute store result score @s gm4_afk_x1 run data get entity @s Pos[0]
execute store result score @s gm4_afk_y1 run data get entity @s Pos[1]
execute store result score @s gm4_afk_z1 run data get entity @s Pos[2]

scoreboard players add @s[scores={gm4_afk_still=3},tag=!gm4_afk] gm4_afk_count 1
scoreboard players set @s[scores={gm4_afk_still=..2}] gm4_afk_count 0
scoreboard players add @s[tag=gm4_afk] gm4_afk_total 1

advancement grant @s[scores={gm4_afk_total=1}] only gm4:are_you_still_there
advancement grant @s[scores={gm4_afk_total=86400}] only gm4:get_back_to_work

execute as @s[scores={gm4_afk_count=900..},tag=!gm4_afk] run function gm4_afk_detector:afk_away
execute as @s[scores={gm4_afk_count=0},tag=gm4_afk] run function gm4_afk_detector:afk_back

