# @s = block compressor armor stand
# called from recipe_check

data merge storage gm4_custom_crafters:temp/crafter {Items:[],CustomName:'{"translate":"%1$s%3427655$s","with":["Compressor",{"translate":"block.gm4.block_compressor"}]}'}
data merge entity @s {CustomName:'"gm4_block_compressor"',ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:1,SkullOwner:{Id:[I;-1851723870,1025001935,-1279456745,2096330633],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NTMzMjYwNjc3NzksInByb2ZpbGVJZCI6IjkxYTBlZmEyM2QxODQ5Y2ZiM2JkMGExNzdjZjM3Nzg4IiwicHJvZmlsZU5hbWUiOiJEdWNrSnIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzFkNmNkYTQwYjViODEyODVhZmRiY2RlOWQ2M2M3OGUxNzZkMzFiNTk0YjFhNmQ5Nzc5OWQ0OTBkN2VmMjkyIn19fQ=="}]}}}}],HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:1}},{}],Pose:{RightArm:[0f, 0f, 0f]}}
playsound minecraft:block.piston.contract block @a[distance=..5]
tag @s add gm4_block_compressor
tag @s remove gm4_custom_crafter
advancement grant @a[distance=..3,gamemode=!spectator] only gm4:block_compressors
