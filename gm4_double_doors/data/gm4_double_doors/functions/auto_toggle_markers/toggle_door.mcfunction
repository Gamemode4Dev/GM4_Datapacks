# toggles the door this auto toggle marker is placed on
# @s = marker entity with the gm4_double_doors_auto_toggle_marker tag
# at @s align xyz
# run from gm4_double_doors:auto_toggle_markers/maintain

# call the corrosponding toggle function

# TODO problem: we don't know about the wood type at this point, nor is the $target_door_state score set properly
# the latter should probably be stored on the marker when it is created (maybe in nbt? it will only be read once after all)
# furthermore, calling the facing/hinge/toggle function would spawn another auto toggle marker, so that is probably a bad idea. Instead a function with just the setblock should be called
# TODO find out how we can branch to different wood types here

# test commands, these dont work as $target_door_state is not set
execute if entity @s[tag=gm4_double_doors_east_left] run function gm4_double_doors:oak/door/east/left/toggle
execute if entity @s[tag=gm4_double_doors_east_right] run function gm4_double_doors:oak/door/east/right/toggle
