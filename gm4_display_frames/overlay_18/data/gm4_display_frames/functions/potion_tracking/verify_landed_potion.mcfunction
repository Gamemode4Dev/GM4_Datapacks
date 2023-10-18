# @s = any potion tracker marker that landed
# run from #gm4_potion_tracking:potion_landed

execute if data storage gm4_potion_tracking:temp entity_data.Item.tag{Potion:"minecraft:invisibility"} run function gm4_display_frames:potion_tracking/splash_item_frames
execute if data storage gm4_potion_tracking:temp entity_data.Item.tag{Potion:"minecraft:long_invisibility"} run function gm4_display_frames:potion_tracking/splash_item_frames
execute if data storage gm4_potion_tracking:temp entity_data.Item.tag{CustomPotionEffects:[{Id:14}]} run function gm4_display_frames:potion_tracking/splash_item_frames
