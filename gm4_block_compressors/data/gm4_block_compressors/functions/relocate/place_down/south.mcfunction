# @s = command block placed by gm4_block_compressors:relocate/place_down_check

function gm4_relocators:place_down/place_block

setblock ~ ~ ~ dropper[facing=south]{CustomName:'{"translate":"%1$s%3427655$s","with":["Compressor",{"translate":"block.gm4.block_compressor"}]}'}
summon armor_stand ~ ~-.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_block_compressor"],Fire:200000,CustomName:'"gm4_block_compressor"',ArmorItems:[{},{},{},{id:player_head,Count:1b,tag:{CustomModelData:1,SkullOwner:{Id:[I;-1851723870,1025001935,-1279456745,2096330633],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NTMzMjYwNjc3NzksInByb2ZpbGVJZCI6IjkxYTBlZmEyM2QxODQ5Y2ZiM2JkMGExNzdjZjM3Nzg4IiwicHJvZmlsZU5hbWUiOiJEdWNrSnIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzFkNmNkYTQwYjViODEyODVhZmRiY2RlOWQ2M2M3OGUxNzZkMzFiNTk0YjFhNmQ5Nzc5OWQ0OTBkN2VmMjkyIn19fQ=="}]}}}}]}
playsound minecraft:block.piston.contract block @a[distance=..5]
