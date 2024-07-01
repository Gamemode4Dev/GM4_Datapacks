# Checks for neighboring doors which may also have to be opened alongside this door.
# @s = player that interacted with a door
# at location of the lower half of the door the player has interacted with
# run from gm4_double_doors:{{ material_name }}/door/left_hinge/get_facing

# open this door
function gm4_double_doors:{{ material_name }}/door/left_hinge/east/toggle

# check for potential neighbouring doors which should also be opened
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:{{ material_name }}_door[hinge=right,facing=east] run function gm4_double_doors:{{ material_name }}/door/right_hinge/east/toggle
execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:{{ material_name }}_door[hinge=right,facing=west] run function gm4_double_doors:{{ material_name }}/door/right_hinge/west/toggle
