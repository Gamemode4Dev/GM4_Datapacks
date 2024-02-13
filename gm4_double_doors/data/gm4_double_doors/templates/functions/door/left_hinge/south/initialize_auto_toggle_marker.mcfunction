# Initializes a freshly spawned auto toggle marker
# @s = newly spawned auto toggle marker
# at @s
# run from toggle functions in gm4_double_doors:{{ material_name }}/door/...

# set name
data modify entity @s CustomName set value '"gm4_double_doors_auto_toggle_marker"'

# store inverted target door state onto marker
execute if score $target_door_state gm4_double_doors_data matches 1 run data modify entity @s data.gm4_double_doors.target_door_state set value 0b
execute unless score $target_door_state gm4_double_doors_data matches 1 run data modify entity @s data.gm4_double_doors.target_door_state set value 1b

# set tags
tag @s add gm4_double_doors_auto_toggle_marker
tag @s add gm4_double_doors_south
tag @s add gm4_double_doors_left
tag @s add gm4_double_doors_{{ material_name }}

# set default lifetime in ticks
scoreboard players set @s gm4_double_doors_auto_toggle_liftime 100

# set starting state to 'waiting_for_player'
scoreboard players set @s gm4_double_doors_auto_toggle_state 0

# schedule auto toggle marker handling
schedule function gm4_double_doors:auto_toggle_marker/find 1t
