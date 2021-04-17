# @s = obsidian block with count of 1 on top of sand next to a clay ball with a count of 1
# run from check_mould_creation

summon vex ~.45 ~-0.845 ~.65 {CustomName:'"gm4_sand_ring"',Tags:["gm4_sand_ring","gm4_new_sand_ring"],Attributes:[{Name:"generic.max_health",Base:0.25}],ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1,tag:{CustomModelData:23,SkullOwner:{Id:[I;140191582,-1151712444,-1271441790,1896239124],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0Nzk4NTI1MDM5MzksInByb2ZpbGVJZCI6Ijk4NWIyNzVlYmI1YTQzNDRiNDM3Njg5NTI4NjNhNjNmIiwicHJvZmlsZU5hbWUiOiJTcGFya3MiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMWZhYmExYzg3NTFjYWIzZjEyZjJlODgwMTRjZjRlYmY2N2ZjNWQ3NGNmY2U5YmUyNTI1YWQ0OWE5MjFkY2YyIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81YzNjYTdlZTJhNDk4ZjFiNWQyNThkNWZhOTI3ZTYzZTQzMzE0M2FkZDU1MzhjZjYzYjZhOWI3OGFlNzM1In19fQ=="}]}}}}],NoAI:1,Silent:1,ActiveEffects:[{Id:14b,Amplifier:1b,Duration:2147483647,ShowParticles:0b}],Invulnerable:1,PersistenceRequired:1}

scoreboard players add @e[type=vex,tag=gm4_new_sand_ring] gm4_ml_ore_cu 0
scoreboard players add @e[type=vex,tag=gm4_new_sand_ring] gm4_ml_ore_al 0
scoreboard players add @e[type=vex,tag=gm4_new_sand_ring] gm4_ml_ore_ba 0
scoreboard players add @e[type=vex,tag=gm4_new_sand_ring] gm4_ml_ore_th 0

scoreboard players set @e[type=vex,tag=gm4_new_sand_ring] gm4_ml_heat 30
tag @e[type=vex,tag=gm4_new_sand_ring] remove gm4_new_sand_ring

kill @e[type=item,limit=1,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:clay_ball",Count:1b},OnGround:1b}]
kill @e[type=item,limit=1,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:obsidian",Count:1b},OnGround:1b}]
