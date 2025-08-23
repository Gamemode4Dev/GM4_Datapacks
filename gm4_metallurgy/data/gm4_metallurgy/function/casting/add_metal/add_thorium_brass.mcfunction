# @s = sand ring that needs to accept a metal
# run from initialize

# add score to sand ring
tag @s add gm4_contains_metal
item modify entity @s armor.head gm4_metallurgy:mould/hot_metal

# add primary metal
scoreboard players operation @s gm4_ml_ore_th += $metal_amount gm4_ml_data

# add secondary metal
execute store result score $metal_amount gm4_ml_data run data get storage gm4_metallurgy:temp/item/ore gm4_metallurgy.metal.amount[1]
scoreboard players operation @s gm4_ml_ore_bi += $metal_amount gm4_ml_data
execute if score $is_obsidian_cast gm4_ml_data matches 1.. run summon item ~.45 ~0.1 ~.65 {Item:{id:"minecraft:obsidian",count:1,components:{"minecraft:custom_model_data":"item/slightly_damaged_obsidian","minecraft:lore":[{"translate":"item.gm4.slightly_damaged_obsidian","fallback":"Slightly Damaged Obsidian","color":"dark_gray"}]}}}

# visuals
particle minecraft:block{block_state:"minecraft:lime_concrete_powder"} ~.45 ~0.1 ~.65 .1 .1 .1 0 2
playsound item.bucket.empty_lava block @a[distance=..8] ~ ~ ~ .25 1.5
advancement grant @a[distance=..5,gamemode=!spectator] only gm4:metallurgy_cast
kill @e[type=item,tag=gm4_ml_in_animation,dx=0,dz=0,limit=1,nbt={Item:{count:1,components:{"minecraft:custom_data":{gm4_metallurgy:{metal:{type:"thorium_brass"}}}}},OnGround:1b}]
