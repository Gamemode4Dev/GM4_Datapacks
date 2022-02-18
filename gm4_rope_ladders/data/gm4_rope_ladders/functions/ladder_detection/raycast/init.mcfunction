# executes as the player if they are holding a rope ladder
# @s = player holding rope ladder
# at @s
# run from gm4_rope_ladders:as_player

tag @s add gm4_rol_holding_ladder

scoreboard players set $ray gm4_rol_data 0 
execute anchored eyes run function gm4_rope_ladders:ladder_detection/raycast/ray

