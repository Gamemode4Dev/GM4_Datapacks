# upgrades armor-stand gm4_lightning_rod_texture_connector's to item_displays

execute as @e[type=armor_stand,tag=gm4_lightning_rod_texture_connector] at @s align xyz run summon item_display ~0.5 ~1 ~0.5 {Tags:["gm4_lightning_rod_texture_connector"],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$texture_connector"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.25,0.25,0.25]}}
kill @e[type=armor_stand,tag=gm4_lightning_rod_texture_connector]
