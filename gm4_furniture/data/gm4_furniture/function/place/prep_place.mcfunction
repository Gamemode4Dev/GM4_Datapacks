# prepares the storage and scores for furniture placement
# @s = player that just placed a furniture player head
# at the center of the furniture player head that was placed
# run from place/check_layer

# override rotation if furniture was placed against a wall (opposite of wall facing)
# 1: north, 2: east, 3: south, 4: west
execute store success score $wall_placement gm4_furniture_data if block ~ ~ ~ player_wall_head
execute if score $wall_placement gm4_furniture_data matches 1 run scoreboard players set $rotation gm4_furniture_data 3
execute if score $wall_placement gm4_furniture_data matches 1 if block ~ ~ ~ player_wall_head[facing=east] run scoreboard players set $rotation gm4_furniture_data 4
execute if score $wall_placement gm4_furniture_data matches 1 if block ~ ~ ~ player_wall_head[facing=south] run scoreboard players set $rotation gm4_furniture_data 1
execute if score $wall_placement gm4_furniture_data matches 1 if block ~ ~ ~ player_wall_head[facing=west] run scoreboard players set $rotation gm4_furniture_data 2

scoreboard players remove $player_head_count gm4_furniture_data 1

function gm4_furniture:place/resolve_id with storage gm4_furniture:temp furniture_data
