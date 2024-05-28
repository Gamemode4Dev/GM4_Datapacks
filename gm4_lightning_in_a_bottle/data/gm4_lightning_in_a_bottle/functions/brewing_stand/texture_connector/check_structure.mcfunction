# checks for the existence of a connected lightning rod and a connector texture entity
# @s = @e[type=marker,tag=gm4_brewing_stand]
# at @s
# run from main

execute if block ~ ~1 ~ lightning_rod[facing=up] align xyz unless entity @e[tag=gm4_lightning_rod_texture_connector,dy=0.01,limit=1] run summon item_display ~0.5 ~1 ~0.5 {Tags:["gm4_lightning_rod_texture_connector"],item:{id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$texture_connector"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.25,0.25,0.25]}}
execute unless block ~ ~1 ~ lightning_rod[facing=up] align xyz run kill @e[type=item_display,tag=gm4_lightning_rod_texture_connector,dy=0.01]
