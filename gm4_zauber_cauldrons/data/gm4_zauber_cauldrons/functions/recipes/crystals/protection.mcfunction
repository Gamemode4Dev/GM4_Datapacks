# @s=boiling zauber cauldron with crystal recipe inside
# at @s
# run from zauber_crystals

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:13,gm4_zauber_cauldrons:{item:"crystal",type:"regeneration"},SkullOwner:{Id:[I;-503854593,212580059,-440694433,-647960158],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NzY4ODYzMDA0MTcsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lNzZmNDQ5MTI2MjQxOTM2ZDE3ODZhNDAyZGY2ZjQ2NWU1ZTdiMjhlZWQzNWFiNzY3MWYwZDI2YjJjZTZlMyJ9fX0="}]}},HideFlags:1,display:{Name:'{"translate":"%1$s%3427655$s","with":["Crystal of Regeneration",{"translate":"item.gm4.zauber_crystal.regeneration"}],"italic":false}'}}}}
scoreboard players set recipe_success gm4_zc_data 1
