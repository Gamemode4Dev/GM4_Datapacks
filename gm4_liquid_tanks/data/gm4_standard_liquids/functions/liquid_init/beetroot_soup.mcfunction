data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Beetroot Soup Tank", {"translate":"block.gm4.liquid_tank.beetroot_soup"}]}'}
summon armor_stand ~ ~-.45 ~ {CustomName:'"gm4_liquid_tank_display"',Tags:["gm4_no_edit","gm4_liquid_tank_display"],NoGravity:1,Marker:1,Silent:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,Fire:20000,ArmorItems:[{},{},{},{id:"player_head",Count:1b,tag:{SkullOwner:{Id:[I;2130271109,-1138636291,-1614258018,-889714317],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0OTgxODE5OTY3NDIsInByb2ZpbGVJZCI6IjIyODQ0MGU4NzJjODRkYzc4MzQ4YjI3NzU4NTAzNGM4IiwicHJvZmlsZU5hbWUiOiJTcGVjaWFsQnVpbGRlcjMyIiwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzRkOTM0ZWRiMzRjM2IxNmRlZWNmMjRkZjhmMTc1NTQyZDAxZWMwNTJmZWZkOTEzNjI4MWJiNmE2Y2E3ZDdkIn19fQ=="}]}}}}]}
data modify entity @s ArmorItems[3].tag.gm4_liquid_tanks.liquid_tag set value "gm4_lt_beetroot_soup"
scoreboard players set @s gm4_lt_max 300
tag @s add gm4_lt_beetroot_soup
tag @s remove gm4_lt_empty
