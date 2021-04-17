data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s%3427655$s","with":["Mushroom Stew Tank", {"translate":"block.gm4.liquid_tank.mushroom_stew"}]}'}
summon armor_stand ~ ~-.45 ~ {CustomName:'"gm4_liquid_tank_display"',Tags:["gm4_no_edit","gm4_liquid_tank_display"],NoGravity:1,Marker:1,Silent:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,Fire:20000,ArmorItems:[{},{},{},{id:"player_head",Count:1b,tag:{SkullOwner:{Id:[I;2130271109,-1138636289,-1614258018,-889714316],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0MjkzNDYwMDU2MjksInByb2ZpbGVJZCI6IjZjZjU0M2E2MGVlOTQzN2NiNjE0YzdiOTRkZTVjNWI3IiwicHJvZmlsZU5hbWUiOiJNcnNNYWtpc3RlaW4iLCJpc1B1YmxpYyI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2VmZTg5ZjEyZjA2N2ViMzlmYTlkZGY4N2U3ZmZiYmRlZmZjZDAyZjVjMThjYjIyNjFkMGY0NDk4YjgxYjQxNyJ9fX0="}]}}}}]}
data modify entity @s ArmorItems[3].tag.gm4_liquid_tanks.liquid_tag set value "gm4_lt_mushroom_stew"
scoreboard players set @s gm4_lt_max 300
tag @s add gm4_lt_mushroom_stew
tag @s remove gm4_lt_empty
