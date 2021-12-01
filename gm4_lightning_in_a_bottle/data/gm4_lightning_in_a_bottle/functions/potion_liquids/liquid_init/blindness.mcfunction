data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Blindness Tank", {"translate":"block.gm4.liquid_tank.blindness"}]}'}
summon armor_stand ~ ~-.45 ~ {CustomName:'"gm4_liquid_tank_display"',Tags:["gm4_no_edit","gm4_liquid_tank_display"],NoGravity:1,Marker:1,Silent:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,HasVisualFire:1,ArmorItems:[{},{},{},{id:"player_head",Count:1b,tag:{SkullOwner:{Id:[I;2130271109,-1138570753,-1614258158,-884567317],Properties:{textures:[{Value:"ewogICJ0aW1lc3RhbXAiIDogMTYzODMwNDA1MjIzMiwKICAicHJvZmlsZUlkIiA6ICI4NmJjNWI2YTYwYjI0N2Y2YTBmNDIyYjUyODlkMTI3ZSIsCiAgInByb2ZpbGVOYW1lIiA6ICJIYXBweV9MaXMiLAogICJzaWduYXR1cmVSZXF1aXJlZCIgOiB0cnVlLAogICJ0ZXh0dXJlcyIgOiB7CiAgICAiU0tJTiIgOiB7CiAgICAgICJ1cmwiIDogImh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvODg1M2Q3NGIzNjZkN2I3ZGFmODY3YTIzOTQzMDUzODAxMmM4OTZhZWM2MGU3MWEyMTQzY2VhYjQ0YmFkYTAxZCIsCiAgICAgICJtZXRhZGF0YSIgOiB7CiAgICAgICAgIm1vZGVsIiA6ICJzbGltIgogICAgICB9CiAgICB9CiAgfQp9"}]}}}}]}
data modify entity @s ArmorItems[3].tag.gm4_liquid_tanks.liquid_tag set value "gm4_lt_blindness"
scoreboard players set @s gm4_lt_max 300
tag @s add gm4_lt_blindness
tag @s remove gm4_lt_empty
