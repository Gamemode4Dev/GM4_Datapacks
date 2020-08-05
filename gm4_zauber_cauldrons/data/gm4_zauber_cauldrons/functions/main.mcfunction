#check creation
execute as @a[gamemode=!spectator] at @s if entity @s[nbt={SelectedItem:{id:"minecraft:enchanted_book"},OnGround:1b}] unless entity @e[type=area_effect_cloud,tag=gm4_zauber_cauldron,distance=..2] anchored eyes positioned ^ ^ ^1.448 align xyz positioned ~.5 ~.5 ~.5 if block ~ ~ ~ cauldron unless block ~ ~ ~ cauldron[level=0] if block ~ ~-1 ~ fire run function gm4_zauber_cauldrons:cauldron/create

#check all cauldrons for their structure, branches off into recipe checks
execute as @e[type=area_effect_cloud,tag=gm4_zauber_cauldron] at @s run function gm4_zauber_cauldrons:cauldron/structure_check

#effect players with luck when they crafted it using flowers and remove tag after death
tag @a[scores={gm4_zc_deaths=1..},tag=gm4_zc_luck] remove gm4_zc_luck
scoreboard players reset @a[scores={gm4_zc_deaths=1..}] gm4_zc_deaths
effect give @a[gamemode=!spectator,tag=gm4_zc_luck] minecraft:luck 8 0 true

#apply crystal effects
scoreboard players add slow_clock gm4_zc_data 1
execute if score slow_clock gm4_zc_data matches 3.. as @a[gamemode=!spectator,nbt={ActiveEffects:[{Id:26b}],Inventory:[{Slot:-106b,id:"minecraft:player_head",tag:{gm4_zauber_cauldrons:{item:"crystal"}}}]}] run function gm4_zauber_cauldrons:recipes/crystals/apply_effects
#grant full zauber armor advancement
execute if score slow_clock gm4_zc_data matches 3.. run advancement grant @a[gamemode=!spectator,nbt={Inventory:[{Slot:100b,tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}},{Slot:101b,tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}},{Slot:102b,tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}},{Slot:103b,tag:{gm4_zauber_cauldrons:{item:"zauber_armor"}}}]}] only gm4:zauber_cauldrons_full_armor

#release vexes from bottled vexes
execute if score slow_clock gm4_zc_data matches 3.. as @e[type=item,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"bottled_vex"}}}}] at @s run function gm4_zauber_cauldrons:cauldron/extra_items/release_from_bottle
execute if score slow_clock gm4_zc_data matches 3.. run scoreboard players set slow_clock gm4_zc_data 0

#store the coordinates of every player's wormhole bottles, if applicable
execute as @a[gamemode=!spectator] run function gm4_zauber_cauldrons:recipes/chorus/store_coordinates
execute if score wormhole_data gm4_zc_data matches 1 run kill @e[type=item,y=-512,dy=0,tag=gm4_zc_wormhole_data,limit=1]
scoreboard players reset wormhole_data gm4_zc_data

#restore broken crystals
data merge entity @e[type=item,limit=1,nbt={Item:{tag:{SkullOwner:{Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NzY4ODc4ODY4MjcsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS83MmRkMTkxZDgxYzg4NDUzYzVlM2JjMWJlMjFkYjVhMTkyZDUyNmI3MTg2YjJmNjk0ZjI4Y2JkZmNjYzYyYzNhIn19fQ=="}]}}}}}] {Item:{tag:{CustomModelData:10,gm4_zauber_cauldrons:{item:"crystal",type:"resistance"},HideFlags:1,display:{Name:"{\"text\":\"Crystal of Resistance\",\"italic\":false,\"color:\":\"yellow\"}"}}}}
data merge entity @e[type=item,limit=1,nbt={Item:{tag:{SkullOwner:{Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NzY4ODgyNDc2MDMsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81OGQ4ZWZjODJlMzQyYmI4MTRmYTc3YTZlNzFmMzNiMGU1YTVkOGI1ZmJiOTI0N2YxOTQ2ZjBmZWI0ODMzNyJ9fX0="}]}}}}}] {Item:{tag:{CustomModelData:11,gm4_zauber_cauldrons:{item:"crystal",type:"fire_resistance"},HideFlags:1,display:{Name:"{\"text\":\"Crystal of Fire Resistance\",\"italic\":false,\"color:\":\"yellow\"}"}}}}
data merge entity @e[type=item,limit=1,nbt={Item:{tag:{SkullOwner:{Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NzY4ODg0MTI0MTksInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8zNDY0MTcxY2Y2ZTJiOWMwYTI1MjRhZGYzZGI0MjdmNWQ1NzdiM2E2YWFmOTIyNDlmZTI4MWM3YzMwNDdmZSJ9fX0="}]}}}}}] {Item:{tag:{CustomModelData:12,gm4_zauber_cauldrons:{item:"crystal",type:"speed"},HideFlags:1,display:{Name:"{\"text\":\"Crystal of Speed\",\"italic\":false,\"color:\":\"yellow\"}"}}}}
data merge entity @e[type=item,limit=1,nbt={Item:{tag:{SkullOwner:{Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NzY4ODYzMDA0MTcsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9lNzZmNDQ5MTI2MjQxOTM2ZDE3ODZhNDAyZGY2ZjQ2NWU1ZTdiMjhlZWQzNWFiNzY3MWYwZDI2YjJjZTZlMyJ9fX0="}]}}}}}] {Item:{tag:{CustomModelData:13,gm4_zauber_cauldrons:{item:"crystal",type:"regeneration"},HideFlags:1,display:{Name:"{\"text\":\"Crystal of Regeneration\",\"italic\":false,\"color:\":\"yellow\"}"}}}}

schedule function gm4_zauber_cauldrons:main 16t
