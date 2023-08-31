# check if furniture fits here
# @s = player who placed the furniture player head
# at the center of the placed block rotated along axis to face towards player or away from the wall, or at any placed marker
# run from any in place/furniture/

# height is only offset down if this is a wall placed furniture (painting)
execute as @e[type=marker,tag=gm4_furniture.marked_block] run data modify entity @s Rotation set from storage gm4_furniture:data Rotation
execute if score $height gm4_furniture_data matches 3.. if score $wall_only gm4_furniture_data matches 1 if score $ceiling_only gm4_furniture_data matches 0 at @e[type=marker,tag=gm4_furniture.marked_block] positioned ^ ^-1 ^ run function gm4_furniture:place/check_size/height_offset
execute if score $height gm4_furniture_data matches 3.. if score $wall_only gm4_furniture_data matches 1 if score $ceiling_only gm4_furniture_data matches 0 run scoreboard players remove $height gm4_furniture_data 1
scoreboard players remove $height gm4_furniture_data 1
execute if score $ceiling_only gm4_furniture_data matches 0 if score $placement_blocked gm4_furniture_data matches 0 at @e[type=marker,tag=gm4_furniture.marked_block,tag=!gm4_furniture.height_marker] positioned ^ ^1 ^ run function gm4_furniture:place/check_size/height_loop
execute if score $ceiling_only gm4_furniture_data matches 1 if score $placement_blocked gm4_furniture_data matches 0 at @e[type=marker,tag=gm4_furniture.marked_block,tag=!gm4_furniture.height_marker] positioned ^ ^-1 ^ run function gm4_furniture:place/check_size/height_loop
