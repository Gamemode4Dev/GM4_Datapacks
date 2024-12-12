# Initiates opening (in the door opening sense) of this trapdoor and looks for additional trapdoors above this trapdoor, unless the maximum trapdoor level was exceeded
# @s = player that interacted with a door
# at location of the lower half of the door the player has interacted with
# run from gm4_double_doors:{{ material_name }}/door/west/right/toggle and gm4_double_doors:{{ material_name }}/door/south/left/toggle

# open this trapdoor
function gm4_double_doors:{{ material_name }}/trapdoor/south_west/toggle

# check for potential trapdoors which should also be opened
scoreboard players remove $trap_door_recursion_level gm4_double_doors_data 1
execute if score $trap_door_recursion_level gm4_double_doors_data matches 1.. positioned ~ ~1 ~ if block ~ ~ ~ minecraft:{{ material_name }}_trapdoor[open=true,half=bottom] unless block ~ ~ ~ minecraft:{{ material_name }}_trapdoor[facing=east] unless block ~ ~ ~ minecraft:{{ material_name }}_trapdoor[facing=north] run function gm4_double_doors:{{ material_name }}/trapdoor/south_west/check_neighbours
