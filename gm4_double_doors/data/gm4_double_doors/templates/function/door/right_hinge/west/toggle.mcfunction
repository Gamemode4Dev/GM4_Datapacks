# Toggles the double door the player has interacted with.
# @s = player that interacted with a door
# at location of the lower half of the left door of the double door the player has interacted with
# run from functions in gm4_double_doors:{{ material_name }}/door/right_hinge/.../check_neighbors

# player just closed a door
execute if score $target_door_state gm4_double_doors_data matches 0 run place template gm4_double_doors:{{ material_name }}/door/west/right/closed ~ ~ ~

# player just opened a door
execute if score $target_door_state gm4_double_doors_data matches 1 run place template gm4_double_doors:{{ material_name }}/door/west/right/open ~ ~ ~

# get target trapdoor state (0->1, 1->0 for this direction)
execute store result score $target_trapdoor_state gm4_double_doors_data if score $target_door_state gm4_double_doors_data matches 0

# check for potential trapdoors which should also be opened
scoreboard players operation $trap_door_recursion_level gm4_double_doors_data = $trap_door_limit gm4_double_doors_data
execute positioned ~ ~2 ~ if block ~ ~ ~ minecraft:{{ material_name }}_trapdoor[open=true,half=bottom] unless block ~ ~ ~ minecraft:{{ material_name }}_trapdoor[facing=east] unless block ~ ~ ~ minecraft:{{ material_name }}_trapdoor[facing=north] run function gm4_double_doors:{{ material_name }}/trapdoor/south_west/check_neighbours

# prepare automatic un-toggling after player walked through, delete preexisting auto toggle markers
execute align xyz store success score $found_prexisting_marker gm4_double_doors_data run kill @e[type=marker,tag=gm4_double_doors_auto_toggle_marker,dx=0]
execute unless score $triggered_by_auto_toggle gm4_double_doors_data matches 1 if score $found_prexisting_marker gm4_double_doors_data matches 0 summon marker run function gm4_double_doors:{{ material_name }}/door/right_hinge/west/initialize_auto_toggle_marker
execute if score $triggered_by_auto_toggle gm4_double_doors_data matches 1 run scoreboard players set $play_sound gm4_double_doors_data 1

# reset fake player
scoreboard players reset $found_prexisting_marker gm4_double_doors_data
