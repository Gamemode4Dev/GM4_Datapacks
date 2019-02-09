#@s = valid pair of shears close enought to a tnt landmine
execute positioned ~ ~1 ~ run particle minecraft:explosion
kill @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1]
execute store result score @s gm4_tnt_cals run data get entity @s Item.tag.Damage
scoreboard players add @s gm4_tnt_cals 1
execute store result entity @s Item.tag.Damage int 1 run scoreboard players get @s gm4_tnt_cals
execute if score @s gm4_tnt_cals matches 238 run kill @s
