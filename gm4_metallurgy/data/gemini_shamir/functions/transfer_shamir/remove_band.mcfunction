#@s = tool with a gemini shamir on it
#called from initiate_transfer

#check whether the other item is an obsidian block
scoreboard players set valid_obsidian gm4_ml_data 0
execute as @e[type=item,dx=0,limit=1,nbt={Item:{Count:1b,id:"minecraft:obsidian"}}] run function gemini_shamir:transfer_shamir/dock_band

execute if score valid_obsidian gm4_ml_data matches 1 run data remove entity @s Item.tag.gm4_metallurgy
execute if score valid_obsidian gm4_ml_data matches 1 run data remove entity @s Item.tag.display.Lore
