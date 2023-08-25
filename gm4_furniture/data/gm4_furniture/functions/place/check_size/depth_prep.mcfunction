# check if furniture fits here
# @s = player who placed the furniture player head
# at the center of the placed block rotated along axis to face towards player or away from the wall, or at any placed marker
# run from any in place/furniture/

execute if score $depth gm4_furniture_data matches 3.. at @e[type=marker,tag=gm4_furniture.marked_block] positioned ^ ^ ^-1 run function gm4_furniture:place/check_size/depth_offset
execute if score $depth gm4_furniture_data matches 3.. run scoreboard players remove $depth gm4_furniture_data 1
scoreboard players remove $depth gm4_furniture_data 1
execute if score $placement_blocked gm4_furniture_data matches 0 at @e[type=marker,tag=gm4_furniture.marked_block] positioned ^ ^ ^1 run function gm4_furniture:place/check_size/depth_loop
