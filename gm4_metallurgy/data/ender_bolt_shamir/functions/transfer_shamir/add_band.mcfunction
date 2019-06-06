#@s = obsidian cast with a ender_bolt shamir on it
#called from initiate_transfer

#check whether the other item is valid
scoreboard players set valid_tool gm4_ml_data 0
execute as @e[type=item,dx=0,limit=1,nbt=!{Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}}] run function ender_bolt_shamir:transfer_shamir/check_tool_validity

execute if score valid_tool gm4_ml_data matches 1 run data merge entity @s {Item:{Count:1b,id:"minecraft:obsidian",tag:{display:{Lore:['"Slightly damaged obsidian"']}}},Tags:["gm4_ml_smooshed"]}
execute if score valid_tool gm4_ml_data matches 1 run data remove entity @s Item.tag.gm4_metallurgy
execute if score valid_tool gm4_ml_data matches 1 run data remove entity @s Item.tag.SkullOwner
