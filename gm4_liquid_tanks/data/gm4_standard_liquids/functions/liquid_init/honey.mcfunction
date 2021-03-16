data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Honey Tank", {"translate":"block.gm4.liquid_tank.honey"}]}'}
summon armor_stand ~ ~-.45 ~ {CustomName:'"gm4_liquid_tank_display"',Tags:["gm4_no_edit","gm4_liquid_tank_display"],NoGravity:1,Marker:1,Silent:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,Fire:20000,ArmorItems:[{},{},{},{id:"player_head",Count:1b,tag:{SkullOwner:{Id:[I;-782351782,542655898,-1075183804,1293758076],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1ODYwNDAzNDcxNzIsInByb2ZpbGVJZCI6IjIyODQ0MGU4NzJjODRkYzc4MzQ4YjI3NzU4NTAzNGM4IiwicHJvZmlsZU5hbWUiOiJTcGVjaWFsQnVpbGRlcjMyIiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2QyZDBlZDU3ZGQwNWYxMGExNTk5ZDFkNWY2Mzg0ZGMxYzgzNWM5ZWVmYWQ5MDFjNTdkZDkxZDg1YWM5MWFjZWIifX19"}]}}}}]}
data modify entity @s ArmorItems[3].tag.gm4_liquid_tanks.liquid_tag set value "gm4_lt_honey"
scoreboard players set @s gm4_lt_max 400
tag @s add gm4_lt_honey
tag @s remove gm4_lt_empty
