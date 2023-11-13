# Checks for neighbouring doors which may also have to be opened alongside this door.
# @s = player that interacted with a door
# at location of the lower half of the door the player has interacted with
# run from gm4_double_doors:{{ material_name }}/door/east/right/get_hinge

# open this door
function gm4_double_doors:{{ material_name }}/door/east/right/toggle

# check for potential neighbouring doors which should also be opened
execute positioned ~ ~ ~-1 if block ~ ~ ~ minecraft:{{ material_name }}_door[hinge=left] run function gm4_double_doors:{{ material_name }}/door/east/left/toggle
execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:{{ material_name }}_door[hinge=left] run function gm4_double_doors:{{ material_name }}/door/west/left/toggle
