# checks for placement of furniture that is allowed to be placed diagonally
# @s = player who placed the furniture player head
# at the center of the placed block rotated along axis to face towards player or away from the wall
# run from any in place/furniture/

scoreboard players set $diag_found gm4_furniture_data 0
execute if block ~ ~ ~ player_head[rotation=1] store success score $diag_found gm4_furniture_data run data modify storage gm4_furniture:data Rotation set value [-157.5F,0F]
execute if score $diag_found gm4_furniture_data matches 0 if block ~ ~ ~ player_head[rotation=2] store success score $diag_found gm4_furniture_data run data modify storage gm4_furniture:data Rotation set value [-135F,0F]
execute if score $diag_found gm4_furniture_data matches 0 if block ~ ~ ~ player_head[rotation=3] store success score $diag_found gm4_furniture_data run data modify storage gm4_furniture:data Rotation set value [-112.5F,0F]

execute if score $diag_found gm4_furniture_data matches 0 if block ~ ~ ~ player_head[rotation=5] store success score $diag_found gm4_furniture_data run data modify storage gm4_furniture:data Rotation set value [-67.5F,0F]
execute if score $diag_found gm4_furniture_data matches 0 if block ~ ~ ~ player_head[rotation=6] store success score $diag_found gm4_furniture_data run data modify storage gm4_furniture:data Rotation set value [-45F,0F]
execute if score $diag_found gm4_furniture_data matches 0 if block ~ ~ ~ player_head[rotation=7] store success score $diag_found gm4_furniture_data run data modify storage gm4_furniture:data Rotation set value [-22.5F,0F]

execute if score $diag_found gm4_furniture_data matches 0 if block ~ ~ ~ player_head[rotation=9] store success score $diag_found gm4_furniture_data run data modify storage gm4_furniture:data Rotation set value [22.5F,0F]
execute if score $diag_found gm4_furniture_data matches 0 if block ~ ~ ~ player_head[rotation=10] store success score $diag_found gm4_furniture_data run data modify storage gm4_furniture:data Rotation set value [45F,0F]
execute if score $diag_found gm4_furniture_data matches 0 if block ~ ~ ~ player_head[rotation=11] store success score $diag_found gm4_furniture_data run data modify storage gm4_furniture:data Rotation set value [67.5F,0F]

execute if score $diag_found gm4_furniture_data matches 0 if block ~ ~ ~ player_head[rotation=13] store success score $diag_found gm4_furniture_data run data modify storage gm4_furniture:data Rotation set value [112.5F,0F]
execute if score $diag_found gm4_furniture_data matches 0 if block ~ ~ ~ player_head[rotation=14] store success score $diag_found gm4_furniture_data run data modify storage gm4_furniture:data Rotation set value [135F,0F]
execute if score $diag_found gm4_furniture_data matches 0 if block ~ ~ ~ player_head[rotation=15] store success score $diag_found gm4_furniture_data run data modify storage gm4_furniture:data Rotation set value [157.5F,0F]

# if a diagonal rotation was found make sure rotation will be set, and limit length / height to 1
execute if score $diag_found gm4_furniture_data matches 1 run scoreboard players set $rotation gm4_furniture_data 5
execute if score $diag_found gm4_furniture_data matches 1 run scoreboard players set $length gm4_furniture_data 1
execute if score $diag_found gm4_furniture_data matches 1 run scoreboard players set $depth gm4_furniture_data 1
