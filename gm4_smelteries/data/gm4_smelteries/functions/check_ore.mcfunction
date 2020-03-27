# @s = smeltery that is looking at a lit furnace
# called by process

data modify entity @s HandItems[0] set from block ^ ^ ^1 Items[{Slot:0b}]
replaceitem entity @s armor.head air
execute store result score can_smelt gm4_bf_data run loot replace entity @s armor.head fish gm4_smelteries:smeltable_display ~ ~ ~ mainhand
replaceitem entity @s weapon air

#check if structure is valid
execute if score can_smelt gm4_bf_data matches 1.. if block ~ ~1 ~ #gm4_smelteries:air if block ~1 ~ ~1 iron_block if block ~1 ~ ~-1 iron_block if block ~-1 ~ ~1 iron_block if block ~-1 ~ ~-1 iron_block if block ~1 ~1 ~1 iron_block if block ~1 ~1 ~-1 iron_block if block ~-1 ~1 ~1 iron_block if block ~-1 ~1 ~-1 iron_block if block ^ ^ ^-1 iron_block if block ^1 ^ ^ iron_block if block ^-1 ^ ^ iron_block if block ^ ^1 ^-1 iron_block if block ^1 ^1 ^ iron_block if block ^-1 ^1 ^ iron_block run function gm4_smelteries:check_cook_time
