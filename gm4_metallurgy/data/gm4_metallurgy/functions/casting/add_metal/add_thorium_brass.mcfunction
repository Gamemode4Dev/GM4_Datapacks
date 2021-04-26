# @s = sand ring that needs to accept a metal
# run from initialize

# add score to sand ring
tag @s add gm4_contains_metal
data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1,tag:{CustomModelData:26,SkullOwner:{Id:[I;140191582,-1151712444,-1271433465,-1758951935],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0ODE0MTE2NTQxODksInByb2ZpbGVJZCI6Ijk4NWIyNzVlYmI1YTQzNDRiNDM3Njg5NTI4NjNhNjNmIiwicHJvZmlsZU5hbWUiOiJTcGFya3MiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvODZkMTEwNmNjZDhhY2E3NDg4N2Q1ODIwNTU0YmZiMzM5YzdhM2NmOTJjNDY1MTU2MmM2NmZiNzZkMTQ0In0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81YzNjYTdlZTJhNDk4ZjFiNWQyNThkNWZhOTI3ZTYzZTQzMzE0M2FkZDU1MzhjZjYzYjZhOWI3OGFlNzM1In19fQ=="}]}}}}]}

# add primary metal
scoreboard players operation @s gm4_ml_ore_th += metal_amount gm4_ml_data

# add secondary metal
execute store result score metal_amount gm4_ml_data run data get storage gm4_metallurgy:temp/item/ore gm4_metallurgy.metal.amount[1]
scoreboard players operation @s gm4_ml_ore_cu += metal_amount gm4_ml_data
execute if score is_obsidian_cast gm4_ml_data matches 1.. run summon item ~.45 ~0.1 ~.65 {Item:{id:"minecraft:obsidian",Count:1b,tag:{display:{Lore:['{"translate":"%1$s%3427655$s","with":["Slightly Damaged Obsidian",{"translate":"item.gm4.slightly_damaged_obsidian"}],"italic":false}']}}}}

# visuals
particle block dead_fire_coral_block ~.45 ~0.1 ~.65 .1 .1 .1 0 2
playsound item.bucket.empty_lava block @a[distance=..8] ~ ~ ~ .25 1.5
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:metallurgy_cast
kill @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,limit=1,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{metal:{type:"thorium_brass"}}}},OnGround:1b}]
