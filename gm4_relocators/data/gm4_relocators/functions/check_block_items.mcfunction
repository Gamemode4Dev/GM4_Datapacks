# @s = machine block armor stand
# run from found_machine

execute store success score block_entity gm4_rl_data run data get block ~ ~ ~ y

execute if score block_entity gm4_rl_data matches 1 unless data block ~ ~ ~ Items[0] run function gm4_relocators:store_machine_data
execute if score block_entity gm4_rl_data matches 1 if data block ~ ~ ~ Items[0] at @p[tag=gm4_relocating_player] run summon item ~ ~ ~ {Item:{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:27,gm4_relocator:1b,display:{Name:'{"translate":"%1$s%3427655$s","with":["Relocator",{"translate":"item.gm4.relocator"}],"italic":false}'},SkullOwner:{Id:"2c0fa9da-b8e7-4dfe-81eb-7885c62d6a92",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE1NjM4MTY4ODE5NTcsInByb2ZpbGVJZCI6IjdkYTJhYjNhOTNjYTQ4ZWU4MzA0OGFmYzNiODBlNjhlIiwicHJvZmlsZU5hbWUiOiJHb2xkYXBmZWwiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzMwM2Q3YTkyNTIxZDZmZTU1M2ZiNGYyNzIxOTI2Yzk4YTVlMDdlMDhmZjdiNzg4OTg1OTc3MGM0Yjg0NmJlZDYifX19"}]}}}}}
execute if score block_entity gm4_rl_data matches 0 run function gm4_relocators:store_machine_data
