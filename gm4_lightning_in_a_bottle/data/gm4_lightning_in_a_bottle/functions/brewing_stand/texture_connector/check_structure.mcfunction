# checks for the existence of a connected lightning rod and a connector texture entity
# @s = @e[type=marker,tag=gm4_brewing_stand]
# at @s
# run from main

# check for lightning rod block above and summon or destroy texture_connector
execute if block ~ ~1 ~ lightning_rod[facing=up] align xyz unless entity @e[type=armor_stand,tag=gm4_lightning_rod_texture_connector,dx=0,limit=1] run summon armor_stand ~0.9125 ~0.4225 ~0.2885 {Tags:["gm4_lightning_rod_texture_connector"],Small:1b,Invulnerable:1b,Silent:1b,NoGravity:1b,HasVisualFire:0b,Invisible:1b,Marker:1b,ShowArms:1b,HandItems:[{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;1196754309,1130089731,-1851853423,152678880],Properties:{textures:[{Value:"ewogICJ0aW1lc3RhbXAiIDogMTYzNzc3MDAzOTc2OCwKICAicHJvZmlsZUlkIiA6ICJmODJmNTQ1MDIzZDA0MTFkYmVlYzU4YWI4Y2JlMTNjNyIsCiAgInByb2ZpbGVOYW1lIiA6ICJSZXNwb25kZW50cyIsCiAgInNpZ25hdHVyZVJlcXVpcmVkIiA6IHRydWUsCiAgInRleHR1cmVzIiA6IHsKICAgICJTS0lOIiA6IHsKICAgICAgInVybCIgOiAiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81YzEzZjIxN2U5NmJmY2VhNjIwZTc3YTIzNjRjYTBkNmE0ZTdhN2UwOGMzNzAzNzI3ODI4MTQ4ZjQxNjM0YmVjIiwKICAgICAgIm1ldGFkYXRhIiA6IHsKICAgICAgICAibW9kZWwiIDogInNsaW0iCiAgICAgIH0KICAgIH0KICB9Cn0="}]}}}},{}],Pose:{RightArm:[315f,45f,0f],LeftArm:[0f,0f,90f]}}
execute unless block ~ ~1 ~ lightning_rod[facing=up] align xyz run kill @e[type=armor_stand,tag=gm4_lightning_rod_texture_connector,dx=0]
