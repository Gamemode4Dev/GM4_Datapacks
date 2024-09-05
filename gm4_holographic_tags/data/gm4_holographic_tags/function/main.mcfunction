
execute as @e[type=area_effect_cloud,tag=gm4_hologram,tag=!smithed.entity] run function gm4_holographic_tags:upgrade_path/smithed_compat

execute as @e[type=area_effect_cloud,tag=gm4_hologram] at @s positioned ^ ^ ^-0.3 positioned ~ ~.3 ~ if entity @e[type=item_frame,predicate=!gm4_holographic_tags:has_item,distance=..0.1,limit=1] run function gm4_holographic_tags:destroy_hologram
execute as @e[type=item_frame,tag=!smithed.entity,tag=!gm4_hologram,predicate=gm4_holographic_tags:has_name_tag] if items entity @s contents *[custom_name] at @s positioned ^ ^ ^0.3 positioned ~ ~-.3 ~ unless entity @e[type=area_effect_cloud,tag=gm4_hologram,distance=..0.1] run function gm4_holographic_tags:create_hologram
tag @e[type=item_frame,tag=gm4_hologram,predicate=!gm4_holographic_tags:has_name_tag] remove gm4_hologram

execute as @e[type=area_effect_cloud,tag=gm4_hologram] at @s positioned ^ ^ ^-0.3 positioned ~ ~.3 ~ if entity @e[type=glow_item_frame,predicate=!gm4_holographic_tags:has_item,distance=..0.1,limit=1] run function gm4_holographic_tags:destroy_hologram
execute as @e[type=glow_item_frame,tag=!smithed.entity,tag=!gm4_hologram,predicate=gm4_holographic_tags:has_name_tag] if items entity @s contents *[custom_name] at @s positioned ^ ^ ^0.3 positioned ~ ~-.3 ~ unless entity @e[type=area_effect_cloud,tag=gm4_hologram,distance=..0.1] run function gm4_holographic_tags:create_hologram
tag @e[type=glow_item_frame,tag=gm4_hologram,predicate=!gm4_holographic_tags:has_name_tag] remove gm4_hologram

schedule function gm4_holographic_tags:main 16t
