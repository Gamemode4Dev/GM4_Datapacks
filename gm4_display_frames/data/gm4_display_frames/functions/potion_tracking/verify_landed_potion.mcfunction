# @s = any potion tracker marker that landed
# run from #gm4_potion_tracking:potion_landed

execute if data storage gm4_potion_tracking:temp entity_data.Item.components{"minecraft:potion_contents":{potion:"minecraft:invisibility"}} run function gm4_display_frames:potion_tracking/splash_item_frames
execute if data storage gm4_potion_tracking:temp entity_data.Item.components{"minecraft:potion_contents":{potion:"minecraft:long_invisibility"}} run function gm4_display_frames:potion_tracking/splash_item_frames
execute if data storage gm4_potion_tracking:temp entity_data.Item.components{"minecraft:potion_contents":{custom_effects:[{id:'minecraft:invisibility'}]}} run function gm4_display_frames:potion_tracking/splash_item_frames
