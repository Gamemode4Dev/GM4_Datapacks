# @s=boiling zauber cauldron with crystal recipe inside
# at @s
# run from zauber_crystals

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
summon item ~ ~.2 ~ {Item:{id:"player_head",Count:1b,tag:{CustomModelData:10,gm4_zauber_cauldrons:{item:"crystal",type:"resistance"},SkullOwner:{Id:[I;120603607,-515099665,-610555661,-656372121],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NzY4ODc4ODY4MjcsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS83MmRkMTkxZDgxYzg4NDUzYzVlM2JjMWJlMjFkYjVhMTkyZDUyNmI3MTg2YjJmNjk0ZjI4Y2JkZmNjYzYyYzNhIn19fQ=="}]}},HideFlags:1,display:{Name:'{"translate":"%1$s%3427655$s","with":["Crystal of Resistance",{"translate":"item.gm4.zauber_crystal.resistance"}],"italic":false}'}}}}
scoreboard players set recipe_success gm4_zc_data 1
