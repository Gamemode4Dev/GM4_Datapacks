schedule function gm4_augmented_armor:tick 1t

# check for items on the ground
execute as @e[type=item,tag=!gm4_aa_item_checked] run function gm4_augmented_armor:check_item

execute as @e[type=marker,tag=gm4_aa_process_marker.tick] run function gm4_augmented_armor:clocks/process_markers_tick
