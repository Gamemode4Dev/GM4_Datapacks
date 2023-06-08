# @s = command block placed by "gm4_relocators:backwards_compatibility/place_down/replace_head"
# located at the command block (where the player head was)

execute if block ~ ~ ~ command_block[facing=east] run setblock ~ ~ ~ dropper[facing=west]
execute if block ~ ~ ~ command_block[facing=west] run setblock ~ ~ ~ dropper[facing=east]
execute if block ~ ~ ~ command_block[facing=south] run setblock ~ ~ ~ dropper[facing=north]
execute if block ~ ~ ~ command_block[facing=north] run setblock ~ ~ ~ dropper[facing=south]
execute if block ~ ~ ~ command_block[facing=down] run setblock ~ ~ ~ dropper[facing=up]

data merge block ~ ~ ~ {CustomName:'{"translate":"container.gm4.block_compressor","fallback":"Compressor"}'}
summon armor_stand ~ ~-.4 ~ {Small:1,NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_block_compressor"],HasVisualFire:1,CustomName:'"gm4_block_compressor"',ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:3420001,SkullOwner:{Id:[I;-1851723870,1025001935,-1279456745,2096330633],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0NTMzMjYwNjc3NzksInByb2ZpbGVJZCI6IjkxYTBlZmEyM2QxODQ5Y2ZiM2JkMGExNzdjZjM3Nzg4IiwicHJvZmlsZU5hbWUiOiJEdWNrSnIiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzFkNmNkYTQwYjViODEyODVhZmRiY2RlOWQ2M2M3OGUxNzZkMzFiNTk0YjFhNmQ5Nzc5OWQ0OTBkN2VmMjkyIn19fQ=="}]}}}}],HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:3420001}},{}],Pose:{RightArm:[0f, 0f, 0f]}}
playsound minecraft:block.piston.contract block @a[distance=..5]
