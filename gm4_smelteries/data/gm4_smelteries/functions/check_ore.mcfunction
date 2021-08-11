# @s = smeltery that is looking at a lit furnace
# called by verify_furnace

#check if item is doubable by setting the head item of the stand
data modify entity @s HandItems[0] set from block ^ ^ ^1 Items[{Slot:0b}]
item replace entity @s armor.head with air
execute store result score can_smelt gm4_bf_data run loot replace entity @s armor.head fish gm4_smelteries:technical/smeltable_display ~ ~ ~ mainhand
item replace entity @s weapon with air
execute if score can_smelt gm4_bf_data matches 0 run item replace entity @s armor.head with gray_stained_glass{CustomModelData:1}

#check if the furnace is close to finish smelting, and then the structure
execute if score can_smelt gm4_bf_data matches 1.. if score @s gm4_bf_data matches 184..199 if block ~ ~1 ~ #gm4:air if block ~1 ~ ~1 iron_block if block ~1 ~ ~-1 iron_block if block ~-1 ~ ~1 iron_block if block ~-1 ~ ~-1 iron_block if block ~1 ~1 ~1 iron_block if block ~1 ~1 ~-1 iron_block if block ~-1 ~1 ~1 iron_block if block ~-1 ~1 ~-1 iron_block if block ^ ^ ^-1 iron_block if block ^1 ^ ^ iron_block if block ^-1 ^ ^ iron_block if block ^ ^1 ^-1 iron_block if block ^1 ^1 ^ iron_block if block ^-1 ^1 ^ iron_block run function gm4_smelteries:start_ticking
