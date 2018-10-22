#@s = valid tnt mine positioned a block up
#runs from tnt_mines:run/at_mine

#removes gm4_tnt_mines_no_explode from players within a radius
tag @a[distance=..0.7] remove gm4_tnt_mines_no_explode
#tags the player if they are sneaking
execute as @a[gamemode=!spectator,distance=..0.7] at @s positioned ~ ~1.7 ~ unless entity @s[dx=0] run tag @s add gm4_tnt_mines_no_explode
#explodes if valid entity in radius is found
execute if entity @e[type=!item,type=!armor_stand,type=!area_effect_cloud,tag=!gm4_tnt_mines_no_explode,distance=..0.7] run function tnt_mines:run/explode