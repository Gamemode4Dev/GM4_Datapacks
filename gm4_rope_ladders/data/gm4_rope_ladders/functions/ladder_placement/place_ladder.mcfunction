# places a ladder
# @s = player holding rope ladder (having right clicked on ladder)
# position of valid ladder location
# run from function gm4_rope_ladders:ladder_placement/scan_column/ray

scoreboard players set $ray gm4_rol_data -999

item modify entity @s weapon.mainhand gm4_rope_ladders:minus_one

advancement grant @s only gm4:rope_ladders

clone ~ ~1 ~ ~ ~1 ~ ~ ~ ~
