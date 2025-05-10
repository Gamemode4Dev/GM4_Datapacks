execute as @e[type=text_display,tag=gm4_hologram] at @s positioned ^ ^ ^-0.3 if entity @e[type=#gm4_holographic_tags:item_frames,predicate=!gm4_holographic_tags:has_item,distance=..0.1,limit=1] run function gm4_holographic_tags:destroy_hologram
execute as @e[type=#gm4_holographic_tags:item_frames,tag=!smithed.entity,tag=!gm4_hologram,predicate=gm4_holographic_tags:has_name_tag] if items entity @s contents *[custom_name] at @s positioned ^ ^ ^0.3 unless entity @e[type=text_display,tag=gm4_hologram,distance=..0.1] run function gm4_holographic_tags:create_hologram
tag @e[type=#gm4_holographic_tags:item_frames,tag=gm4_hologram,predicate=!gm4_holographic_tags:has_name_tag] remove gm4_hologram

schedule function gm4_holographic_tags:main 16t
