# @s = player that interacts with a rcd interaction while holding ladder
# at @s
# run from advancement: gm4_rope_ladders:right_click_detection

# revoke advancement
advancement revoke @s only gm4_rope_ladders:right_click_detection

# reset
scoreboard players set $ladder_placed gm4_rol_data 0
scoreboard players set $loop gm4_rol_data 0
# store gametime
execute store result score $gametime gm4_rol_data run time query gametime

# find ladder block
execute as @e[type=interaction,tag=gm4_rol_rcd_ladder,distance=..8] if data entity @s interaction run function gm4_rope_ladders:mechanics/ladder_placement/find_ladder

# successful place
execute if score $ladder_placed gm4_rol_data matches 1 run function gm4_rope_ladders:mechanics/ladder_placement/successful_place
