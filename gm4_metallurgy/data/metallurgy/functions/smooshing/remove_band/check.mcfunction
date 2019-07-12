
#check whether the other item is an obsidian block

scoreboard players set valid_obsidian gm4_ml_data 0
execute as @e[type=item,dx=0,limit=1,nbt={Item:{Count:1b,id:"minecraft:obsidian"}}] run function metallurgy:smooshing/remove_band/found_obsidian

#if both custom model data tags are the same, then we can delete it
execute store success score custom_model_data gm4_ml_data run data modify entity @s Item.tag.gm4_metallurgy.custom_model_data set from entity @s Item.tag.CustomModelData
execute if score valid_obsidian gm4_ml_data matches 1 if score custom_model_data gm4_ml_data matches 0 run data remove entity @s Item.tag.CustomModelData

execute if score valid_obsidian gm4_ml_data matches 1 run data remove entity @s Item.tag.gm4_metallurgy
execute if score valid_obsidian gm4_ml_data matches 1 run data remove entity @s Item.tag.display.Lore
