# @s = ender_eye item above valid hopper
# run from ender_eye

summon armor_stand ~ ~ ~ {Tags:["gm4_ender_hopper","gm4_no_edit","gm4_machine"],Small:1b,Marker:1b,Invisible:1b,Invulnerable:1b,NoGravity:1b,ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{CustomModelData:2,SkullOwner:{Id:[I;-1738856610,-1151712444,-1271437163,677619263],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0Nzc4NTE1MDIxNDUsInByb2ZpbGVJZCI6Ijk4NWIyNzVlYmI1YTQzNDRiNDM3Njg5NTI4NjNhNjNmIiwicHJvZmlsZU5hbWUiOiJTcGFya3MiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNzhiOWUyMTVkM2Q4NzQ3YzhkZjYxNGZkOGZlNGQxMzlkZTEyMTI0ZmZlMTlmMjkwOWQzOGNkNGE3MzI5MjVkIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81YzNjYTdlZTJhNDk4ZjFiNWQyNThkNWZhOTI3ZTYzZTQzMzE0M2FkZDU1MzhjZjYzYjZhOWI3OGFlNzM1In19fQ=="}]}}}}],DisabledSlots:2039583,HandItems:[{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:3}}],Pose:{RightArm:[0f, 0f, 0f]}}
particle large_smoke ~ ~0.5 ~ 0.2 0.2 0.2 0 10
data merge block ~ ~ ~ {Items:[],CustomName:'{"translate":"%1$s%3427655$s","with":["Ender Hopper",{"translate":"block.gm4.ender_hopper"}]}'}
playsound minecraft:block.portal.trigger block @a[distance=..5] ~ ~ ~ 0.2
kill @s
