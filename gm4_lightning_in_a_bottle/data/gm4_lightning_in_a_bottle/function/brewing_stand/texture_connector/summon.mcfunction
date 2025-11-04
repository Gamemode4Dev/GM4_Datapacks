# summons correct texture connector
# @s = @e[type=marker,tag=gm4_brewing_stand] or @e[type=armor_stand,tag=gm4_lightning_rod_texture_connector]
# at @s align xyz
# run from brewing_stand/texture_connector/force_update and main and upgrade_paths/1.4

# normal
execute if block ~ ~1 ~ minecraft:lightning_rod run summon item_display ~0.5 ~1 ~0.5 {Tags:["gm4_lightning_rod_texture_connector"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$texture_connector"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.25,0.25,0.25]}}
execute if block ~ ~1 ~ minecraft:waxed_lightning_rod run summon item_display ~0.5 ~1 ~0.5 {Tags:["gm4_lightning_rod_texture_connector"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$texture_connector"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.25,0.25,0.25]}}

# exposed
execute if block ~ ~1 ~ minecraft:exposed_lightning_rod run summon item_display ~0.5 ~1 ~0.5 {Tags:["gm4_lightning_rod_texture_connector"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$texture_connector_exposed"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.25,0.25,0.25]}}
execute if block ~ ~1 ~ minecraft:waxed_exposed_lightning_rod run summon item_display ~0.5 ~1 ~0.5 {Tags:["gm4_lightning_rod_texture_connector"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$texture_connector_exposed"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.25,0.25,0.25]}}

# weathered
execute if block ~ ~1 ~ minecraft:weathered_lightning_rod run summon item_display ~0.5 ~1 ~0.5 {Tags:["gm4_lightning_rod_texture_connector"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$texture_connector_weathered"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.25,0.25,0.25]}}
execute if block ~ ~1 ~ minecraft:waxed_weathered_lightning_rod run summon item_display ~0.5 ~1 ~0.5 {Tags:["gm4_lightning_rod_texture_connector"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$texture_connector_weathered"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.25,0.25,0.25]}}

# oxidized
execute if block ~ ~1 ~ minecraft:oxidized_lightning_rod run summon item_display ~0.5 ~1 ~0.5 {Tags:["gm4_lightning_rod_texture_connector"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$texture_connector_oxidized"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.25,0.25,0.25]}}
execute if block ~ ~1 ~ minecraft:waxed_oxidized_lightning_rod run summon item_display ~0.5 ~1 ~0.5 {Tags:["gm4_lightning_rod_texture_connector"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$texture_connector_oxidized"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.25,0.25,0.25]}}
