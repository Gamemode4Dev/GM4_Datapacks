# Checks the facing block state of the door which was clicked.
# @s = player that interacted with a door
# at location of the lower half of the door the player has interacted with
# run from gm4_double_doors:door/get_lower_half

execute if block ~ ~ ~ #minecraft:doors[facing=south] run function gm4_double_doors:door/south/get_hinge
execute if block ~ ~ ~ #minecraft:doors[facing=west] run function gm4_double_doors:door/west/get_hinge
execute if block ~ ~ ~ #minecraft:doors[facing=north] run function gm4_double_doors:door/north/get_hinge
execute if block ~ ~ ~ #minecraft:doors[facing=east] run function gm4_double_doors:door/east/get_hinge
