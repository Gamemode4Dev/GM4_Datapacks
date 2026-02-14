# check if furniture fits here
# @s = player who placed the furniture player head
# at the center of the placed block rotated along axis to face towards player or away from the wall
# run from any in place/furniture/

execute if score $length gm4_furniture_data matches 3.. positioned ^-1 ^ ^ run function gm4_furniture:place/check_size/length_offset
scoreboard players remove $length gm4_furniture_data 1
execute if score $placement_blocked gm4_furniture_data matches 0 positioned ^1 ^ ^ run function gm4_furniture:place/check_size/length_loop
