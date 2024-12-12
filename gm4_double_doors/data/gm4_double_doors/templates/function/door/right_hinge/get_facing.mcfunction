# Checks the facing block state of the door which was clicked.
# @s = player that interacted with a door
# at location of the lower half of the door the player has interacted with
# run from gm4_double_doors:{{ material_name }}/door/right_hinge/get_lower_half

execute if block ~ ~ ~ minecraft:{{ material_name }}_door[facing=east] run function gm4_double_doors:{{ material_name }}/door/right_hinge/east/find_neighbors
execute if block ~ ~ ~ minecraft:{{ material_name }}_door[facing=north] run function gm4_double_doors:{{ material_name }}/door/right_hinge/north/find_neighbors
execute if block ~ ~ ~ minecraft:{{ material_name }}_door[facing=south] run function gm4_double_doors:{{ material_name }}/door/right_hinge/south/find_neighbors
execute if block ~ ~ ~ minecraft:{{ material_name }}_door[facing=west] run function gm4_double_doors:{{ material_name }}/door/right_hinge/west/find_neighbors
