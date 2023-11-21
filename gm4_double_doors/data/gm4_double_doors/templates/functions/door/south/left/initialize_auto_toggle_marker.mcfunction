# Initializes a freshly spawned auto toggle marker
# @s = newly spawned auto toggle marker
# at @s
# run from toggle functions in gm4_double_doors:{{ material_name }}/door/...

# set name
data modify entity @s CustomName set value '"gm4_double_doors_auto_toggle_marker"'

# set tags
tag @s add gm4_double_doors_auto_toggle_marker
tag @s add gm4_double_doors_south_left

# set default lifetime in ticks
scoreboard players set @s gm4_double_doors_auto_toggle_liftime 300

# set starting state to 'waiting_for_player'
scoreboard players set @s gm4_double_doors_auto_toggle_state 0

# schedule auto toggle marker handling
schedule function gm4_double_doors:auto_toggle_marker/find 1t
