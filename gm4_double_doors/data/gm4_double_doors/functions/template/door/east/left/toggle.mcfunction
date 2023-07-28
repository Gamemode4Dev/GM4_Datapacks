# Toggles the double door the player has interacted with.
# @s = player that interacted with a door
# at location of the lower half of the left door of the double door the player has interacted with
# run from check_neighbours functions in gm4_double_doors:$material_name$/door/...

# player just closed a door
execute if score $target_door_state gm4_double_doors_data matches 0 run place template gm4_double_doors:$material_name$/door/east/left/closed ~ ~ ~

# player just opened a door
execute if score $target_door_state gm4_double_doors_data matches 1 run place template gm4_double_doors:$material_name$/door/east/left/open ~ ~ ~

# get target trapdoor state (0->1, 1->0 for this direction)
execute store result score $target_trapdoor_state gm4_double_doors_data if score $target_door_state gm4_double_doors_data matches 0

# check for potential trapdoors which should also be opened
scoreboard players operation $trap_door_recursion_level gm4_double_doors_data = $trap_door_limit gm4_double_doors_data
execute positioned ~ ~2 ~ if block ~ ~ ~ minecraft:$material_name$_trapdoor[open=true,half=bottom] unless block ~ ~ ~ minecraft:$material_name$_trapdoor[facing=west] unless block ~ ~ ~ minecraft:$material_name$_trapdoor[facing=north] run function gm4_double_doors:$material_name$/trapdoor/south_east/check_neighbours
