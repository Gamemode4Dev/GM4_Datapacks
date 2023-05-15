# @s = command block placed by "gm4_relocators:backwards_compatibility/place_down/replace_head"
# located at the command block (where the player head was)

execute if block ~ ~ ~ command_block[facing=east] run setblock ~ ~ ~ hopper[facing=east]
execute if block ~ ~ ~ command_block[facing=west] run setblock ~ ~ ~ hopper[facing=west]
execute if block ~ ~ ~ command_block[facing=south] run setblock ~ ~ ~ hopper[facing=south]
execute if block ~ ~ ~ command_block[facing=north] run setblock ~ ~ ~ hopper[facing=north]
execute if block ~ ~ ~ command_block[facing=down] run setblock ~ ~ ~ hopper[facing=down]

data merge block ~ ~ ~ {CustomName:'{"translate":"container.gm4.ender_hopper","fallback":"Ender Hopper"}'}
summon armor_stand ~ ~-.5 ~ {Tags:["gm4_ender_hopper","gm4_no_edit"],Small:1b,Marker:1b,Invisible:1b,Invulnerable:1b,NoGravity:1b,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:3420002,SkullOwner:{Id:[I;-1738856610,-1151712444,-1271437163,677619263],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0Nzc4NTE1MDIxNDUsInByb2ZpbGVJZCI6Ijk4NWIyNzVlYmI1YTQzNDRiNDM3Njg5NTI4NjNhNjNmIiwicHJvZmlsZU5hbWUiOiJTcGFya3MiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNzhiOWUyMTVkM2Q4NzQ3YzhkZjYxNGZkOGZlNGQxMzlkZTEyMTI0ZmZlMTlmMjkwOWQzOGNkNGE3MzI5MjVkIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81YzNjYTdlZTJhNDk4ZjFiNWQyNThkNWZhOTI3ZTYzZTQzMzE0M2FkZDU1MzhjZjYzYjZhOWI3OGFlNzM1In19fQ=="}]}}}}],DisabledSlots:2039583,HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:3420003}}],Pose:{RightArm:[0f, 0f, 0f]}}
particle large_smoke ~ ~0.5 ~ 0.2 0.2 0.2 0 10
playsound minecraft:block.respawn_anchor.charge block @a[distance=..5] ~ ~ ~ 0.3 0.7
