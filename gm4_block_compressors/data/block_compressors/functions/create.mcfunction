data merge block ~ ~ ~ {Items:[],CustomName:"\"Compressor\""}
data merge entity @s {CustomName:"\"gm4_block_compressor\"",ArmorItems:[{},{},{},{id:player_head,tag:{SkullOwner:{Id:"91a0efa2-3d18-49cf-b3bd-0a177cf37789",Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NTMzMjYwNjc3NzksInByb2ZpbGVJZCI6IjkxYTBlZmEyM2QxODQ5Y2ZiM2JkMGExNzdjZjM3Nzg4IiwicHJvZmlsZU5hbWUiOiJEdWNrSnIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzFkNmNkYTQwYjViODEyODVhZmRiY2RlOWQ2M2M3OGUxNzZkMzFiNTk0YjFhNmQ5Nzc5OWQ0OTBkN2VmMjkyIn19fQ=="}]}}}}]}
playsound minecraft:block.piston.contract block @a[distance=..5]
tag @s add gm4_block_compressor
advancement grant @a[distance=..3,gamemode=spectator] only gm4:block_compressors
