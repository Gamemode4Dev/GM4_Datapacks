# prepares the storage and scores for block placement
# @s = player that just placed a machine block player head
# located at the center of the block that was placed
# run from gm4_machines:resolve_load/place_machine_block

# overwrite rotation if player is looking highly up or down
# key: direction of player
# 1: up, 2: down
execute store result score $x_rotation gm4_machine_data run data get entity @s Rotation[1]
execute if score $x_rotation gm4_machine_data matches -90..-45 run scoreboard players set $rotation gm4_machine_data 1
execute if score $x_rotation gm4_machine_data matches 45..90 run scoreboard players set $rotation gm4_machine_data 2

# store face placed on
# key: block face
# 1: up, 2: down, 3: north, 4: east, 5: south, 6: west
scoreboard players set $face_placement gm4_machine_data 1
execute if block ~ ~ ~ player_head if score $x_rotation gm4_machine_data matches -90..0 run scoreboard players set $face_placement gm4_machine_data 2
execute if block ~ ~ ~ player_wall_head[facing=north] run scoreboard players set $face_placement gm4_machine_data 3
execute if block ~ ~ ~ player_wall_head[facing=east] run scoreboard players set $face_placement gm4_machine_data 4
execute if block ~ ~ ~ player_wall_head[facing=south] run scoreboard players set $face_placement gm4_machine_data 5
execute if block ~ ~ ~ player_wall_head[facing=west] run scoreboard players set $face_placement gm4_machine_data 6

data modify storage gm4_machines:temp id set from block ~ ~ ~ SkullOwner.Name

scoreboard players set $placed_block gm4_machine_data 0
scoreboard players remove $player_head_count gm4_machine_data 1

function #gm4_machines:place_down
data remove storage gm4_machines:temp id

# prevent multi-machines
execute store result score $entity_count gm4_machine_data if entity @e[type=marker,tag=gm4_machine_marker,distance=..0.1]
execute if score $entity_count gm4_machine_data matches 2.. run setblock ~ ~ ~ air destroy
