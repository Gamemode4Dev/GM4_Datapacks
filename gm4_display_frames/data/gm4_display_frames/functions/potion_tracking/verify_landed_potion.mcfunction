# @s = any potion tracker marker that landed
# run from #gm4_potion_tracking:potion_landed

execute if predicate gm4_display_frames:invisibility_potion_marker run function gm4_display_frames:potion_tracking/splash_item_frames
