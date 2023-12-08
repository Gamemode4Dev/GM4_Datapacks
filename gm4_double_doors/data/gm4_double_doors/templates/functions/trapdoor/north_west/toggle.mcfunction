# Toggles this trapdoor, in the sense that the trapdoor is rotated around the z-axis (like a door)
# @s = player that interacted with a door
# at location of the lower half of the door the player has interacted with
# run from gm4_double_doors:{{ material_name }}/trapdoor/north_west/check_neighbours

# player just closed a door
execute if score $target_trapdoor_state gm4_double_doors_data matches 0 run setblock ~ ~ ~ {{ material_name }}_trapdoor[open=true,half=bottom,facing=north]

# player just opened a door
execute if score $target_trapdoor_state gm4_double_doors_data matches 1 run setblock ~ ~ ~ {{ material_name }}_trapdoor[open=true,half=bottom,facing=west]
