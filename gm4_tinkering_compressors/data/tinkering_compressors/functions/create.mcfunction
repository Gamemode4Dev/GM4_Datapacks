data merge block ~ ~-0.5 ~ {Items:[],CustomName:'{"translate":"%1$s%3427655$s","with":["Tinkering Compressor",{"translate":"block.gm4.tinkering_compressor"}]}'}
data merge entity @s {CustomName:'"gm4_tinkering_compressor"',ArmorItems:[{},{},{},{id:player_head,Count:1b,tag:{CustomModelData:1,SkullOwner:{Id:"91a0efa2-3d18-49cf-b3bd-0a177cf37789",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NTMzMjYwNjc3NzksInByb2ZpbGVJZCI6IjkxYTBlZmEyM2QxODQ5Y2ZiM2JkMGExNzdjZjM3Nzg4IiwicHJvZmlsZU5hbWUiOiJEdWNrSnIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzFkNmNkYTQwYjViODEyODVhZmRiY2RlOWQ2M2M3OGUxNzZkMzFiNTk0YjFhNmQ5Nzc5OWQ0OTBkN2VmMjkyIn19fQ=="}]}}}}]}
kill @e[type=item,sort=nearest,tag=gm4_tc_on_compressor,limit=1,distance=..0.9]
playsound minecraft:entity.firework_rocket.blast block @a[distance=..5]
particle cloud ~ ~ ~ 0.1 0.1 0.1 0.05 10
tag @s remove gm4_block_compressor
tag @s add gm4_tinkering_compressor
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:tinkering_compressors
