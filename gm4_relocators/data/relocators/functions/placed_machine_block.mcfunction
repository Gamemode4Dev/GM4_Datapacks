# @s = player who placed a relocated block
# run from advancement "place_relocated_block"

advancement revoke @s only relocators:place_relocated_block

summon armor_stand ~ ~ ~ {Silent:1,Small:1,Invisible:1,Marker:1,NoGravity:1,Tags:["gm4_relocated_ray"],HandItems:[{},{id:"minecraft:stone_button",Count:1b}]}
data modify entity @e[type=armor_stand,tag=gm4_relocated_ray,distance=..1,limit=1,sort=nearest] HandItems[1].id set from entity @s SelectedItem.id
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[tag=gm4_relocated_ray] ^ ^ ^ ~ ~
scoreboard players set gm4_ray_counter gm4_rl_data 0
execute as @e[tag=gm4_relocated_ray] at @s run function relocators:ray
execute at @e[tag=gm4_relocated_ray] align xyz run summon armor_stand ~0.5 ~ ~0.5 {Tags:["gm4_rl_set_stand_data"],NoGravity:1b,Invisible:1b,Marker:1b}
kill @e[tag=gm4_relocated_ray]
execute at @s[gamemode=!creative] run summon item ~ ~ ~ {Item:{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:26,gm4_relocator:1b,display:{Name:'{"translate":"%1$s%3427655$s","with":["Relocator",{"translate":"item.gm4.relocator"}],"italic":false}'},SkullOwner:{Id:"2c0fa9da-b8e7-4dfe-81eb-7885c62d6a92",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1NjM4MTY4ODE5NTcsInByb2ZpbGVJZCI6IjdkYTJhYjNhOTNjYTQ4ZWU4MzA0OGFmYzNiODBlNjhlIiwicHJvZmlsZU5hbWUiOiJHb2xkYXBmZWwiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzMwM2Q3YTkyNTIxZDZmZTU1M2ZiNGYyNzIxOTI2Yzk4YTVlMDdlMDhmZjdiNzg4OTg1OTc3MGM0Yjg0NmJlZDYifX19"}]}}}}}

execute at @e[type=armor_stand,tag=gm4_rl_set_stand_data] run function relocators:set_machine_data
