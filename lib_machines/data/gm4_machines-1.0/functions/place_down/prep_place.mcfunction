# prepares the storage and scores for block placement
# @s = player that just placed a machine block player head
# located at the center of the block that was placed
# run from gm4_machines:resolve_load/place_machine_block

execute store result score $x_rotation gm4_machine_data run data get entity @s Rotation[1]
execute store result score $y_rotation gm4_machine_data run data get entity @s Rotation[0]
scoreboard players set $rotation gm4_machine_data 0

# key: direction of player
# 1: up, 2: down, 3: north, 4: east, 5: south, 6: west
execute if score $x_rotation gm4_machine_data matches -90..-45 run scoreboard players set $rotation gm4_machine_data 1
execute if score $x_rotation gm4_machine_data matches 45..90 run scoreboard players set $rotation gm4_machine_data 2
execute if score $rotation gm4_machine_data matches 0 if score $y_rotation gm4_machine_data matches -135..-45 run scoreboard players set $rotation gm4_machine_data 4
execute if score $rotation gm4_machine_data matches 0 if score $y_rotation gm4_machine_data matches -45..45 run scoreboard players set $rotation gm4_machine_data 5
execute if score $rotation gm4_machine_data matches 0 if score $y_rotation gm4_machine_data matches 45..135 run scoreboard players set $rotation gm4_machine_data 6
execute if score $rotation gm4_machine_data matches 0 run scoreboard players set $rotation gm4_machine_data 3

data modify storage gm4_machines:temp machine_data set from entity @s SelectedItem.tag.gm4_machines
scoreboard players set $placed_block gm4_machine_data 0

function #gm4_machines:place_down
