# selects the material of the toggle marker in question
# @s = marker entity with the gm4_double_doors_auto_toggle_marker tag
# at @s align xyz
# run from gm4_double_doors:auto_toggle_marker/maintain

execute store result score $target_door_state gm4_double_doors_data run data get entity @s data.gm4_double_doors.target_door_state

for material_name in ctx.meta['wood_types']:
    execute unless score $toggled_door gm4_double_doors_data matches 1.. if entity @s[tag=f"gm4_double_doors_{material_name}"] run function f"gm4_double_doors:{material_name}/door/get_facing"

scoreboard players reset $toggled_door gm4_double_doors_data
