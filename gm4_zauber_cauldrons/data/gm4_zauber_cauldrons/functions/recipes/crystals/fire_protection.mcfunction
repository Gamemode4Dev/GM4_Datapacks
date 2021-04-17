# @s=boiling zauber cauldron with crystal recipe inside
# at @s
# run from zauber_crystals

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:11,gm4_zauber_cauldrons:{item:"crystal",type:"fire_resistance"},SkullOwner:{Id:[I;-398456370,435267517,408512583,-719739212],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NzY4ODgyNDc2MDMsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81OGQ4ZWZjODJlMzQyYmI4MTRmYTc3YTZlNzFmMzNiMGU1YTVkOGI1ZmJiOTI0N2YxOTQ2ZjBmZWI0ODMzNyJ9fX0="}]}},HideFlags:1,display:{Name:'{"translate":"%1$s%3427655$s","with":["Crystal of Fire Resistance",{"translate":"item.gm4.zauber_crystal.fire_resistance"}],"italic":false}'}}}}
scoreboard players set recipe_success gm4_zc_data 1
