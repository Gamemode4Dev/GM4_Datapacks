# Checks for neighboring doors which may also have to be opened alongside this door.
# @s = player that interacted with a door
# at location of the lower half of the door the player has interacted with
# run from gm4_double_doors:{{ material_name }}/door/right_hinge/south/get_hinge

# open this door
function gm4_double_doors:{{ material_name }}/door/right_hinge/south/toggle

# check for potential neighbouring doors which should also be opened
execute positioned ~1 ~ ~ if block ~ ~ ~ minecraft:{{ material_name }}_door[hinge=left,facing=south] run function gm4_double_doors:{{ material_name }}/door/left_hinge/south/toggle
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:{{ material_name }}_door[hinge=left,facing=north] run function gm4_double_doors:{{ material_name }}/door/left_hinge/north/toggle
