# prepares the storage and scores for block placement
# @s = player that just placed a machine block player head
# located at the center of the block that was placed
# run from gm4_machines:resolve_load/place_machine_block

execute if block ~ ~ ~ player_head if entity @s[x_rotation=0..90] run scoreboard players set $rotation gm4_machine_data 1
execute if block ~ ~ ~ player_head if entity @s[x_rotation=-90..0] run scoreboard players set $rotation gm4_machine_data 2
execute if block ~ ~ ~ player_wall_head[facing=north] run scoreboard players set $rotation gm4_machine_data 3
execute if block ~ ~ ~ player_wall_head[facing=east] run scoreboard players set $rotation gm4_machine_data 4
execute if block ~ ~ ~ player_wall_head[facing=south] run scoreboard players set $rotation gm4_machine_data 5
execute if block ~ ~ ~ player_wall_head[facing=west] run scoreboard players set $rotation gm4_machine_data 6

data modify storage gm4_machines:temp machine_data set from entity @s SelectedItem.tag.gm4_machines
scoreboard players set $placed_block gm4_machine_data 0

function #gm4_machines:place_down
