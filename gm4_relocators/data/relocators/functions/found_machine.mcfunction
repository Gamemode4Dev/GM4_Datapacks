# @s = player who placed a relocator and is looking at a machine block run at the block
# run from check_machine_block and check_machine_block_wall

execute align xyz positioned ~ ~ ~ unless entity @e[type=armor_stand,tag=gm4_no_edit,tag=!gm4_liquid_tank_display,nbt={Invisible:1b,Marker:1b,NoGravity:1b},dx=0,dz=0,dy=-1] at @s[gamemode=!creative] run summon item ~ ~ ~ {Item:{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:26,gm4_relocator:1b,display:{Name:'{"translate":"%1$s%3427655$s","with":["Relocator",{"translate":"item.gm4.relocator"}],"italic":false}'},SkullOwner:{Id:"2c0fa9da-b8e7-4dfe-81eb-7885c62d6a92",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1NjM4MTY4ODE5NTcsInByb2ZpbGVJZCI6IjdkYTJhYjNhOTNjYTQ4ZWU4MzA0OGFmYzNiODBlNjhlIiwicHJvZmlsZU5hbWUiOiJHb2xkYXBmZWwiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzMwM2Q3YTkyNTIxZDZmZTU1M2ZiNGYyNzIxOTI2Yzk4YTVlMDdlMDhmZjdiNzg4OTg1OTc3MGM0Yjg0NmJlZDYifX19"}]}}}}}

execute align xyz positioned ~ ~ ~ if entity @e[type=armor_stand,tag=gm4_no_edit,tag=!gm4_liquid_tank_display,nbt={Invisible:1b,Marker:1b,NoGravity:1b},dx=0,dz=0,dy=-1] run advancement grant @s only gm4:relocators

tag @s add gm4_relocating_player
execute align xyz positioned ~ ~ ~ as @e[type=armor_stand,tag=gm4_no_edit,tag=!gm4_liquid_tank_display,nbt={Invisible:1b,Marker:1b,NoGravity:1b},limit=1,sort=nearest,dx=0,dz=0,dy=-1] run function relocators:check_block_items
tag @s remove gm4_relocating_player

fill ~3 ~3 ~3 ~-3 ~-3 ~-3 air replace player_head{Owner:{Id:"2c0fa9da-b8e7-4dfe-81eb-7885c62d6a92"}}
fill ~3 ~3 ~3 ~-3 ~-3 ~-3 air replace player_wall_head{Owner:{Id:"2c0fa9da-b8e7-4dfe-81eb-7885c62d6a92"}}
