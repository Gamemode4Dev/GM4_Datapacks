# @s = player who used chorus and has yet to move after teleporting
# run from temp_tick

effect give @s minecraft:blindness 2 255 true

tag @s[type=!player] add gm4_ta_has_moved

execute unless entity @s[tag=gm4_ta_has_moved] store result score current gm4_ta_pos_x run data get entity @s Pos[0] 100
execute unless entity @s[tag=gm4_ta_has_moved] unless score current gm4_ta_pos_x = @s gm4_ta_pos_x run tag @s add gm4_ta_has_moved

execute unless entity @s[tag=gm4_ta_has_moved] store result score current gm4_ta_pos_y run data get entity @s Pos[1] 100
execute unless entity @s[tag=gm4_ta_has_moved] unless score current gm4_ta_pos_y = @s gm4_ta_pos_y run tag @s add gm4_ta_has_moved

execute unless entity @s[tag=gm4_ta_has_moved] store result score current gm4_ta_pos_z run data get entity @s Pos[2] 100
execute unless entity @s[tag=gm4_ta_has_moved] unless score current gm4_ta_pos_z = @s gm4_ta_pos_z run tag @s add gm4_ta_has_moved

execute if entity @s[tag=gm4_ta_has_moved] at @s run function gm4_teleportation_anchors:player/move_player
