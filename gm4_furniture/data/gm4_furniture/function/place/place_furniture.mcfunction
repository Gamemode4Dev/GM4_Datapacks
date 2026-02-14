# finds the player head that was placed by the player
# @s = player that just placed a furniture player head
# at @s
advancement revoke @s only gm4_furniture:place_furniture
# run from place/place_furniture_water

# get item data
execute store success score $mainhand gm4_furniture_data run data modify storage gm4_furniture:temp furniture_data set from entity @s SelectedItem.components."minecraft:custom_data".gm4_furniture 
execute if score $mainhand gm4_furniture_data matches 0 run data modify storage gm4_furniture:temp furniture_data set from entity @s equipment.offhand.components."minecraft:custom_data".gm4_furniture 

# get rotation of player
# key: direction of player
# 1: north, 2: east, 3: south, 4: west
execute store result score $y_rotation gm4_furniture_data run data get entity @s Rotation[0]
scoreboard players set $rotation gm4_furniture_data 0

execute if score $y_rotation gm4_furniture_data matches 45..135 run scoreboard players set $rotation gm4_furniture_data 4
execute if score $rotation gm4_furniture_data matches 0 if score $y_rotation gm4_furniture_data matches -45..45 run scoreboard players set $rotation gm4_furniture_data 3
execute if score $rotation gm4_furniture_data matches 0 if score $y_rotation gm4_furniture_data matches -135..-45 run scoreboard players set $rotation gm4_furniture_data 2
execute if score $rotation gm4_furniture_data matches 0 run scoreboard players set $rotation gm4_furniture_data 1

# find player heads in the specific region
scoreboard players set $player_head_count gm4_furniture_data 0
execute if score $rotation gm4_furniture_data matches 1 run function gm4_furniture:place/count_heads/north
execute if score $rotation gm4_furniture_data matches 2 run function gm4_furniture:place/count_heads/east
execute if score $rotation gm4_furniture_data matches 3 run function gm4_furniture:place/count_heads/south
execute if score $rotation gm4_furniture_data matches 4 run function gm4_furniture:place/count_heads/west

# replace player heads with the corresponding block
scoreboard players set $layer_count gm4_furniture_data 0
execute if score $player_head_count gm4_furniture_data matches 1.. if score $rotation gm4_furniture_data matches 1 align xyz positioned ~0.5 ~0.5 ~0.5 rotated 180 0 positioned ^-4 ^-4 ^-1 run function gm4_furniture:place/check_layer
execute if score $player_head_count gm4_furniture_data matches 1.. if score $rotation gm4_furniture_data matches 2 align xyz positioned ~0.5 ~0.5 ~0.5 rotated -90 0 positioned ^-4 ^-4 ^-1 run function gm4_furniture:place/check_layer
execute if score $player_head_count gm4_furniture_data matches 1.. if score $rotation gm4_furniture_data matches 3 align xyz positioned ~0.5 ~0.5 ~0.5 rotated 0 0 positioned ^-4 ^-4 ^-1 run function gm4_furniture:place/check_layer
execute if score $player_head_count gm4_furniture_data matches 1.. if score $rotation gm4_furniture_data matches 4 align xyz positioned ~0.5 ~0.5 ~0.5 rotated 90 0 positioned ^-4 ^-4 ^-1 run function gm4_furniture:place/check_layer

# cleanup
data remove storage gm4_furniture:temp furniture_data
