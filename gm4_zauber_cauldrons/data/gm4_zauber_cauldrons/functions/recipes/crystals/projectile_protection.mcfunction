# @s=boiling zauber cauldron with crystal recipe inside
# at @s
# run from zauber_crystals

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:12,gm4_zauber_cauldrons:{item:"crystal",type:"speed"},SkullOwner:{Id:[I;143602933,54143057,74884136,193769722],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NzY4ODg0MTI0MTksInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8zNDY0MTcxY2Y2ZTJiOWMwYTI1MjRhZGYzZGI0MjdmNWQ1NzdiM2E2YWFmOTIyNDlmZTI4MWM3YzMwNDdmZSJ9fX0="}]}},HideFlags:1,display:{Name:'{"translate":"%1$s%3427655$s","with":["Crystal of Speed",{"translate":"item.gm4.zauber_crystal.speed"}],"italic":false}'}}}}
scoreboard players set recipe_success gm4_zc_data 1
