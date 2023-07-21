# checks for the existence of a connected lightning rod and a connector texture entity
# @s = @e[type=marker,tag=gm4_brewing_stand]
# at @s
# run from main

execute if block ~ ~1 ~ lightning_rod[facing=up] align xyz unless entity @e[tag=gm4_lightning_rod_texture_connector,dy=0.01,limit=1] run summon item_display ~0.5 ~1 ~0.5 {Tags:["gm4_lightning_rod_texture_connector"],item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;1196754309,1130089731,-1851853423,152678880],Properties:{textures:[{Value:"ewogICJ0aW1lc3RhbXAiIDogMTYzNzc3MDAzOTc2OCwKICAicHJvZmlsZUlkIiA6ICJmODJmNTQ1MDIzZDA0MTFkYmVlYzU4YWI4Y2JlMTNjNyIsCiAgInByb2ZpbGVOYW1lIiA6ICJSZXNwb25kZW50cyIsCiAgInNpZ25hdHVyZVJlcXVpcmVkIiA6IHRydWUsCiAgInRleHR1cmVzIiA6IHsKICAgICJTS0lOIiA6IHsKICAgICAgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81YzEzZjIxN2U5NmJmY2VhNjIwZTc3YTIzNjRjYTBkNmE0ZTdhN2UwOGMzNzAzNzI3ODI4MTQ4ZjQxNjM0YmVjIiwKICAgICAgIm1ldGFkYXRhIiA6IHsKICAgICAgICAibW9kZWwiIDogInNsaW0iCiAgICAgIH0KICAgIH0KICB9Cn0="}]}}}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.25,0.25,0.25]}}
execute unless block ~ ~1 ~ lightning_rod[facing=up] align xyz run kill @e[type=item_display,tag=gm4_lightning_rod_texture_connector,dy=0.01]
