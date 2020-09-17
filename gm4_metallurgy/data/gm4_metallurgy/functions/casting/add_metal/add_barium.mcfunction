#@s = sand ring that needs to accept a metal
# run from initialize

#add score to sand ring
tag @s add gm4_contains_metal
data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1,tag:{CustomModelData:26,SkullOwner:{Id:[I;140191582,-1151712444,-1271433465,-1758951935],Properties:{textures:[{Value:"eyJ0aW1lc3RhbXAiOjE0ODE0MTE2NTQxODksInByb2ZpbGVJZCI6Ijk4NWIyNzVlYmI1YTQzNDRiNDM3Njg5NTI4NjNhNjNmIiwicHJvZmlsZU5hbWUiOiJTcGFya3MiLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvODZkMTEwNmNjZDhhY2E3NDg4N2Q1ODIwNTU0YmZiMzM5YzdhM2NmOTJjNDY1MTU2MmM2NmZiNzZkMTQ0In0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81YzNjYTdlZTJhNDk4ZjFiNWQyNThkNWZhOTI3ZTYzZTQzMzE0M2FkZDU1MzhjZjYzYjZhOWI3OGFlNzM1In19fQ=="}]}}}}]}
execute if entity @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,nbt=!{Item:{Count:1b,tag:{gm4_metallurgy:{has_shamir:1b}}},OnGround:1b}] run scoreboard players add @s gm4_ml_ore_ba 1
execute if entity @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{has_shamir:1b}}},OnGround:1b}] run scoreboard players add @s gm4_ml_ore_ba 9
execute if entity @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{has_shamir:1b,ore_type:"barium"}}},OnGround:1b}] run scoreboard players add @s gm4_ml_ore_ba 3
execute if entity @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{has_shamir:1b,ore_type:"barimium"}}},OnGround:1b}] run scoreboard players add @s gm4_ml_ore_al 3
particle block granite ~.45 ~0.1 ~.65 .1 .1 .1 0 9
particle block white_concrete_powder ~.45 ~0.1 ~.65 .1 .1 .1 0 2
playsound item.bucket.empty_lava block @a[distance=..8] ~ ~ ~ .25 1.5
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:metallurgy_cast
execute as @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{has_shamir:1b}}},OnGround:1b}] run summon item ~.5 ~ ~.5 {Item:{id:"minecraft:obsidian",Count:1b,tag:{display:{Lore:['{"translate":"%1$s%3427655$s","with":["Slightly Damaged Obsidian",{"translate":"item.gm4.slightly_damaged_obsidian"}],"italic":false}']}}}}
kill @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,limit=1,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{ore_type:"barium"}}},OnGround:1b}]
kill @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,limit=1,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{ore_type:"barimium"}}},OnGround:1b}]
