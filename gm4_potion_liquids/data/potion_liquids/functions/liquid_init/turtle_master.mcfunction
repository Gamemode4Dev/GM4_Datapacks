data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s","with":["Turtle Master Potion Tank", {"translate":"block.gm4.liquid_tank.turtle_master"}]}'}
summon armor_stand ~ ~-.45 ~ {CustomName:"\"gm4_liquid_tank_display\"",Tags:["gm4_no_edit","gm4_liquid_tank_display"],NoGravity:1,Marker:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,Fire:20000,ArmorItems:[{},{},{},{id:"player_head",Count:1b,tag:{SkullOwner:{Id:228440e8-72a8-4d17-8649-b277385034c8,Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1NTE3MTgxMDc4NjMsInByb2ZpbGVJZCI6IjIyODQ0MGU4NzJjODRkYzc4MzQ4YjI3NzU4NTAzNGM4IiwicHJvZmlsZU5hbWUiOiJTcGVjaWFsQnVpbGRlcjMyIiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzVhODlmM2Q3MGNhYmYyYTEwM2Y3MDYwZDU0NTA0NDhjMDM3YjZjMWM3MjBkM2U5OGViOTViZmY0NzAwNjdhNTIifX19"}]}}}}]}
scoreboard players set @s gm4_lt_max 300
tag @s add gm4_lt_turtle_master
tag @s remove gm4_lt_empty
