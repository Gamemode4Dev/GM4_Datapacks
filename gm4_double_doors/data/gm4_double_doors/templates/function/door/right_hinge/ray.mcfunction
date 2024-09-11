# ray cast to find door
# @s = player that interacted with a door
# at @s anchored eyes positioned ^ ^ ^0.X where X = step count
# run from gm4_double_doors:{{ material_name }}/door/right_hinge/use or self

# check block
scoreboard players set $found gm4_double_doors_data 0
execute align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ minecraft:{{ material_name }}_door[hinge=right] run function gm4_double_doors:{{ material_name }}/door/right_hinge/get_lower_half

# runs the loop again
scoreboard players remove $ray gm4_double_doors_data 1
execute unless score $found gm4_double_doors_data matches 1 if score $ray gm4_double_doors_data matches 1.. positioned ^ ^ ^0.1 run function gm4_double_doors:{{ material_name }}/door/right_hinge/ray
