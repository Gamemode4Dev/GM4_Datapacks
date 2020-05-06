#@s refers to a player who is holding a spooled crossbow
#run from pulse_check

#store amount of string
execute store result score @s[gamemode=survival] gm4_string_count run clear @s minecraft:string 0
scoreboard players set @s[gamemode=creative] gm4_string_count 40

#store vertical rotation
#up   (-)
#down (+)
execute store result score @s gm4_rot_x run data get entity @s Rotation[1]

#store horizontal rotation
#south (0  )
#west  (90 )
#north (180)
#east  (270)
execute store result score @s gm4_rot_y run data get entity @s Rotation[0]
