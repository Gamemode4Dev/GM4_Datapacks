# Checks for neighboring doors which may also have to be opened alongside this door.
# @s = player that interacted with a door
# at location of the lower half of the door the player has interacted with
# run from gm4_double_doors:{{ material_name }}/door/left_hinge/get_facing

# open this door
function gm4_double_doors:{{ material_name }}/door/left_hinge/south/toggle

# check for potential neighbouring doors which should also be opened, this neighbor has to be of the opposite hinge
execute positioned ~-1 ~ ~ if block ~ ~ ~ minecraft:{{ material_name }}_door[hinge=right,facing=south] run function gm4_double_doors:{{ material_name }}/door/right_hinge/south/toggle
execute positioned ~ ~ ~1 if block ~ ~ ~ minecraft:{{ material_name }}_door[hinge=right,facing=north] run function gm4_double_doors:{{ material_name }}/door/right_hinge/north/toggle
