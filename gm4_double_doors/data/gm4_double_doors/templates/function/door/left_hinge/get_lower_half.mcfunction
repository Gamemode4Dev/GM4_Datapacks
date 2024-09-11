# Forces the block selected by the raycast to be the lower half of a door
# @s = player that interacted with a door
# at location of the door the player has interacted with
# run from gm4_double_doors:{{material_name}}/door/left_hinge/ray

scoreboard players set $found gm4_double_doors_data 1

# store whether the player opened a door (=1) or closed a door (=0)
scoreboard players set $target_door_state gm4_double_doors_data 0
execute if block ~ ~ ~ minecraft:{{ material_name }}_door[open=true] run scoreboard players set $target_door_state gm4_double_doors_data 1

# if the targeted block is an upper half, get the lower half and reposition execution location
# also ensure that the door is not broken (aka actually has both blocks present)
execute if block ~ ~ ~ minecraft:{{ material_name }}_door[half=upper] positioned ~ ~-1 ~ if block ~ ~ ~ minecraft:{{ material_name }}_door[half=lower] run function gm4_double_doors:{{ material_name }}/door/left_hinge/get_facing
execute if block ~ ~ ~ minecraft:{{ material_name }}_door[half=lower] if block ~ ~1 ~ minecraft:{{ material_name }}_door[half=upper] run function gm4_double_doors:{{ material_name }}/door/left_hinge/get_facing
