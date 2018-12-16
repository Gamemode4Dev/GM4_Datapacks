#@s=boiling zauber cauldron with crystal recipe inside
#at @s
#run from zauber_potions

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_zauber_cauldrons:{item:"crystal",type:"fire_resistance"},SkullOwner:{Id:"d15e515a-2058-459a-bfe9-ab429a0d2e7c",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NzY4ODgyNDc2MDMsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81OGQ4ZWZjODJlMzQyYmI4MTRmYTc3YTZlNzFmMzNiMGU1YTVkOGI1ZmJiOTI0N2YxOTQ2ZjBmZWI0ODMzNyJ9fX0="}]}},HideFlags:1,display:{Name:"\"§eCrystal of Fire Resistance§r\""}}}}
scoreboard players set recipe_success gm4_zc_data 1
