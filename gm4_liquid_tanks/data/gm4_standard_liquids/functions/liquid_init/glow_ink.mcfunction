data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Glow Ink Tank", {"translate":"container.gm4.liquid_tank.glow_ink"}]}'}
summon armor_stand ~ ~-.45 ~ {CustomName:'"gm4_liquid_tank_display"',Tags:["gm4_no_edit","gm4_liquid_tank_display"],NoGravity:1,Marker:1,Silent:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,HasVisualFire:1,ArmorItems:[{},{},{},{id:"player_head",Count:1b,tag:{SkullOwner:{Id:[I;2130271109,-1138570753,-1614258158,-884567317],Properties:{textures:[{Value:"ewogICJ0aW1lc3RhbXAiIDogMTYyNzQyMDQ0MTc4MiwKICAicHJvZmlsZUlkIiA6ICIyMjg0NDBlODcyYzg0ZGM3ODM0OGIyNzc1ODUwMzRjOCIsCiAgInByb2ZpbGVOYW1lIiA6ICJTcGVjaWFsQnVpbGRlcjMyIiwKICAidGV4dHVyZXMiIDogewogICAgIlNLSU4iIDogewogICAgICAidXJsIiA6ICJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2ZjYjc1NzljZWQ1NTRiZWU0ZmQ5ZmZhMGYzYjQ5NGU0YjJhOWE4MDBmM2ZiNmI4Yjc0YjVlMmU3MThjMTgzYmEiCiAgICB9CiAgfQp9"}]}}}}]}
data modify entity @s ArmorItems[3].tag.gm4_liquid_tanks.liquid_tag set value "gm4_lt_glow_ink"
scoreboard players set @s gm4_lt_max 300
tag @s add gm4_lt_glow_ink
tag @s remove gm4_lt_empty
