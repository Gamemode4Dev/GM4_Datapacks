# @s = armor_stand moulds
# run from main


# kill moulds that left their sand block

scoreboard players remove @s gm4_ml_heat 1
execute if block ~ ~1 ~ lava run scoreboard players add @s gm4_ml_heat 3
execute if score @s gm4_ml_heat matches 1..89 unless block ~ ~ ~ #minecraft:sand run function gm4_metallurgy:casting/destroy_mould
execute unless score @s gm4_ml_heat matches 1..89 run function gm4_metallurgy:casting/destroy_mould

# update old casts (pre PR#487: https://github.com/Gamemode4Dev/GM4_Datapacks/pull/487)
execute if score @s gm4_ml_heat matches 50..89 align xyz positioned ~ ~1 ~ as @e[type=item,dx=0,dy=0,dz=0,tag=!gm4_ml_has_latest_nbt] if data entity @s Item.tag.gm4_metallurgy.stored_shamir run function gm4_metallurgy:update_nbt_version/load_band

# add metals if player desires to do so
execute if score @s gm4_ml_heat matches 50..89 align xyz positioned ~ ~1 ~ if entity @e[type=item,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{metal:{castable:1b}}}},OnGround:1b},dx=0,dy=0,dz=0] run function gm4_metallurgy:casting/add_metal/initialize

# hot ring without metal
execute if score @s[tag=!gm4_contains_metal] gm4_ml_heat matches 50..51 run data modify entity @s ArmorItems[3].tag set value {CustomModelData:3420024,SkullOwner:{Id:[I;140191582,-1151712444,-1271434748,932201856],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0ODE0MTE3MjM4MDYsInByb2ZpbGVJZCI6Ijk4NWIyNzVlYmI1YTQzNDRiNDM3Njg5NTI4NjNhNjNmIiwicHJvZmlsZU5hbWUiOiJTcGFya3MiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTc0NTVkNjg3MjJkOTU3ZmI1ZGVjZGNjY2NjMWI2MWU4NzlhOTY3ZjFiZGM3YzJhMmZkMTlhYTI3OWU4ODUifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzVjM2NhN2VlMmE0OThmMWI1ZDI1OGQ1ZmE5MjdlNjNlNDMzMTQzYWRkNTUzOGNmNjNiNmE5Yjc4YWU3MzUifX19"}]}}}

# hot ring with metal
execute if score @s[tag=gm4_contains_metal] gm4_ml_heat matches 50..51 run data modify entity @s ArmorItems[3].tag set value {CustomModelData:3420026,SkullOwner:{Id:[I;140191582,-1151712444,-1271433465,-1758951935],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0ODE0MTE2NTQxODksInByb2ZpbGVJZCI6Ijk4NWIyNzVlYmI1YTQzNDRiNDM3Njg5NTI4NjNhNjNmIiwicHJvZmlsZU5hbWUiOiJTcGFya3MiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvODZkMTEwNmNjZDhhY2E3NDg4N2Q1ODIwNTU0YmZiMzM5YzdhM2NmOTJjNDY1MTU2MmM2NmZiNzZkMTQ0In0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81YzNjYTdlZTJhNDk4ZjFiNWQyNThkNWZhOTI3ZTYzZTQzMzE0M2FkZDU1MzhjZjYzYjZhOWI3OGFlNzM1In19fQ=="}]}}}

# cool (I'm way too awesome!) ring without metals
execute if score @s[tag=!gm4_contains_metal] gm4_ml_heat matches 48..49 run data modify entity @s ArmorItems[3].tag set value {CustomModelData:3420023,SkullOwner:{Id:[I;140191582,-1151712444,-1271450254,-1988033943],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0ODE0MTE0NTAzOTYsInByb2ZpbGVJZCI6Ijk4NWIyNzVlYmI1YTQzNDRiNDM3Njg5NTI4NjNhNjNmIiwicHJvZmlsZU5hbWUiOiJTcGFya3MiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMWZhYmExYzg3NTFjYWIzZjEyZjJlODgwMTRjZjRlYmY2N2ZjNWQ3NGNmY2U5YmUyNTI1YWQ0OWE5MjFkY2YyIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81YzNjYTdlZTJhNDk4ZjFiNWQyNThkNWZhOTI3ZTYzZTQzMzE0M2FkZDU1MzhjZjYzYjZhOWI3OGFlNzM1In19fQ=="}]}}}

# cool ring with metal
execute if score @s[tag=gm4_contains_metal] gm4_ml_heat matches 48..49 run data modify entity @s ArmorItems[3].tag set value {CustomModelData:3420025,SkullOwner:{Id:[I;140191582,-1151712444,-1271443335,826741136],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0ODE0MTE1NjYwMjQsInByb2ZpbGVJZCI6Ijk4NWIyNzVlYmI1YTQzNDRiNDM3Njg5NTI4NjNhNjNmIiwicHJvZmlsZU5hbWUiOiJTcGFya3MiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZjM3ZjE2Zjc2MTk1ZWM3OWI4MzFmMzc5ZjkzYjYwYzg2MWZkNGNhYmYyZTI5ZDNmZTlkYTJmODU4OTJkY2EifSwiQ0FQRSI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlLzVjM2NhN2VlMmE0OThmMWI1ZDI1OGQ1ZmE5MjdlNjNlNDMzMTQzYWRkNTUzOGNmNjNiNmE5Yjc4YWU3MzUifX19"}]}}}


execute if score @s gm4_ml_heat matches 56.. run particle lava ~ ~1 ~ 0 0 0 0.005 1
execute if score @s gm4_ml_heat matches 80.. run particle large_smoke ~ ~1 ~ 0 0 0 0.05 6
