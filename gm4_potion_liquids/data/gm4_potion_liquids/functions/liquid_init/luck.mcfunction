data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Luck Potion Tank", {"translate":"block.gm4.liquid_tank.luck"}]}'}
summon armor_stand ~ ~-.45 ~ {CustomName:"\"gm4_liquid_tank_display\"",Tags:["gm4_no_edit","gm4_liquid_tank_display"],NoGravity:1,Marker:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,Fire:20000,ArmorItems:[{},{},{},{id:"player_head",Count:1b,tag:{SkullOwner:{Id:"228440e8-92c8-4dc7-8047-b277584924c8",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1NTE4MjQwMTMxMzAsInByb2ZpbGVJZCI6IjIyODQ0MGU4NzJjODRkYzc4MzQ4YjI3NzU4NTAzNGM4IiwicHJvZmlsZU5hbWUiOiJTcGVjaWFsQnVpbGRlcjMyIiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzg5NGY2ZTRkZmU4Y2E2ZjVjOTg5YjZlNjAyMWM4YTgzMjQzYjgzYTdkYzI1OWI4NmI2ZGNiZmE0OGMxOTQ3ZGEifX19"}]}}}}]}
data modify entity @s ArmorItems[3].tag.gm4_liquid_tanks.liquid_tag set value "gm4_lt_luck"
scoreboard players set @s gm4_lt_max 300
tag @s add gm4_lt_luck
tag @s remove gm4_lt_empty
