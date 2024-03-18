# @s = sand ring that needs to accept a metal
# run from initialize

# add score to sand ring
tag @s add gm4_contains_metal
data modify entity @s ArmorItems[3].tag set value {CustomModelData:"block/mould/hot_metal",SkullOwner:"$mould/hot_metal"}
scoreboard players operation @s gm4_ml_ore_al += $metal_amount gm4_ml_data
execute if score $is_obsidian_cast gm4_ml_data matches 1.. run summon item ~.45 ~0.1 ~.65 {Item:{id:"minecraft:obsidian",Count:1b,tag:{CustomModelData:"item/slightly_damaged_obsidian",display:{Lore:['{"translate":"item.gm4.slightly_damaged_obsidian","fallback":"Slightly Damaged Obsidian","color":"dark_gray"}']}}}}
execute unless score $is_obsidian_cast gm4_ml_data matches 1.. run particle block andesite ~.45 ~0.1 ~.65 .1 .1 .1 0 9
particle block pink_terracotta ~.45 ~0.1 ~.65 .1 .1 .1 0 2
playsound item.bucket.empty_lava block @a[distance=..8] ~ ~ ~ .25 1.5
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:metallurgy_cast
kill @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,limit=1,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{metal:{type:"aluminium"}}}},OnGround:1b}]
