#@s=boiling zauber cauldron with crystal recipe inside
#at @s
#run from zauber_potions

execute align xyz run kill @e[type=item,dx=1,dy=1,dz=1]
summon item ~ ~.2 ~ {Item:{id:"minecraft:player_head",Count:1b,tag:{gm4_zauber_cauldrons:{item:"crystal",type:"regeneration"},SkullOwner:{Id:"d15e515a-2058-459a-bfe9-ab449a0d2e7c",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NzY4ODYzMDA0MTcsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lNzZmNDQ5MTI2MjQxOTM2ZDE3ODZhNDAyZGY2ZjQ2NWU1ZTdiMjhlZWQzNWFiNzY3MWYwZDI2YjJjZTZlMyJ9fX0="}]}},HideFlags:1,display:{Name:"\"§eCrystal of Regeneration§r\""}}}}
scoreboard players set recipe_success gm4_zc_data 1
