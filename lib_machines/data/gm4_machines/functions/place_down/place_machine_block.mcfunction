# finds the player head that was placed by the player
# @s = player that just placed a machine block player head
# located at @s
# run from gm4_machines:resolve_load/place_machine_block

advancement revoke @s only gm4_machines:place_machine_block

# get rotation of player
# key: direction of player
# 3: north, 4: east, 5: south, 6: west
execute store result score $y_rotation gm4_machine_data run data get entity @s Rotation[0]
scoreboard players set $rotation gm4_machine_data 0

execute if score $y_rotation gm4_machine_data matches 45..135 run scoreboard players set $rotation gm4_machine_data 6
execute if score $rotation gm4_machine_data matches 0 if score $y_rotation gm4_machine_data matches -45..45 run scoreboard players set $rotation gm4_machine_data 5
execute if score $rotation gm4_machine_data matches 0 if score $y_rotation gm4_machine_data matches -135..-45 run scoreboard players set $rotation gm4_machine_data 4
execute if score $rotation gm4_machine_data matches 0 run scoreboard players set $rotation gm4_machine_data 3

# store cardinal y_rotation
scoreboard players operation $single_rotation gm4_machine_data = $rotation gm4_machine_data
scoreboard players remove $single_rotation gm4_machine_data 2

# find player heads in the specific region
scoreboard players set $player_head_count gm4_machine_data 0
execute if score $rotation gm4_machine_data matches 3 run function gm4_machines:place_down/count_heads/north
execute if score $rotation gm4_machine_data matches 4 run function gm4_machines:place_down/count_heads/east
execute if score $rotation gm4_machine_data matches 5 run function gm4_machines:place_down/count_heads/south
execute if score $rotation gm4_machine_data matches 6 run function gm4_machines:place_down/count_heads/west

# replace player heads with the corresponding block
scoreboard players set $layer_count gm4_machine_data 0
execute if score $player_head_count gm4_machine_data matches 1.. if score $rotation gm4_machine_data matches 3 align xyz positioned ~0.5 ~0.5 ~0.5 rotated 180 0 positioned ^-4 ^-4 ^-1 run function gm4_machines:place_down/check_layer
execute if score $player_head_count gm4_machine_data matches 1.. if score $rotation gm4_machine_data matches 4 align xyz positioned ~0.5 ~0.5 ~0.5 rotated -90 0 positioned ^-4 ^-4 ^-1 run function gm4_machines:place_down/check_layer
execute if score $player_head_count gm4_machine_data matches 1.. if score $rotation gm4_machine_data matches 5 align xyz positioned ~0.5 ~0.5 ~0.5 rotated 0 0 positioned ^-4 ^-4 ^-1 run function gm4_machines:place_down/check_layer
execute if score $player_head_count gm4_machine_data matches 1.. if score $rotation gm4_machine_data matches 6 align xyz positioned ~0.5 ~0.5 ~0.5 rotated 90 0 positioned ^-4 ^-4 ^-1 run function gm4_machines:place_down/check_layer
