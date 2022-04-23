# updates old machine armor stands
# @s = smeltery armor stand
# located at @s
# run from gm4_smelteries:main

# update blocks
scoreboard players set $smeltery_placed gm4_machine_data 0
execute store success score $smeltery_placed gm4_machine_data if block ~1 ~ ~ furnace[facing=east] if block ~-1 ~ ~-1 iron_block if block ~-1 ~ ~ iron_block if block ~-1 ~ ~1 iron_block if block ~ ~ ~-1 iron_block if block ~ ~ ~1 iron_block if block ~1 ~ ~-1 iron_block if block ~1 ~ ~1 iron_block if block ~-1 ~1 ~-1 iron_block if block ~-1 ~1 ~ iron_block if block ~-1 ~1 ~1 iron_block if block ~ ~1 ~-1 iron_block if block ~ ~1 ~1 iron_block if block ~1 ~1 ~-1 iron_block if block ~1 ~1 ~1 iron_block run function gm4_smelteries:upgrade_machine_stand/east
execute if score $smeltery_placed gm4_machine_data matches 0 store success score $smeltery_placed gm4_machine_data if block ~-1 ~ ~ furnace[facing=west] if block ~-1 ~ ~-1 iron_block if block ~-1 ~ ~1 iron_block if block ~ ~ ~-1 iron_block if block ~ ~ ~1 iron_block if block ~1 ~ ~-1 iron_block if block ~1 ~ ~ iron_block if block ~1 ~ ~1 iron_block if block ~-1 ~1 ~-1 iron_block if block ~-1 ~1 ~1 iron_block if block ~ ~1 ~-1 iron_block if block ~ ~1 ~1 iron_block if block ~1 ~1 ~-1 iron_block if block ~1 ~1 ~ iron_block if block ~1 ~1 ~1 iron_block run function gm4_smelteries:upgrade_machine_stand/west
execute if score $smeltery_placed gm4_machine_data matches 0 store success score $smeltery_placed gm4_machine_data if block ~ ~ ~1 furnace[facing=south] if block ~-1 ~ ~-1 iron_block if block ~-1 ~ ~ iron_block if block ~-1 ~ ~1 iron_block if block ~ ~ ~-1 iron_block if block ~1 ~ ~-1 iron_block if block ~1 ~ ~ iron_block if block ~1 ~ ~1 iron_block if block ~-1 ~1 ~-1 iron_block if block ~-1 ~1 ~ iron_block if block ~-1 ~1 ~1 iron_block if block ~ ~1 ~-1 iron_block if block ~1 ~1 ~-1 iron_block if block ~1 ~1 ~ iron_block if block ~1 ~1 ~1 iron_block run function gm4_smelteries:upgrade_machine_stand/south
execute if score $smeltery_placed gm4_machine_data matches 0 store success score $smeltery_placed gm4_machine_data if block ~ ~ ~-1 furnace[facing=north] if block ~-1 ~ ~-1 iron_block if block ~-1 ~ ~ iron_block if block ~-1 ~ ~1 iron_block if block ~ ~ ~1 iron_block if block ~1 ~ ~-1 iron_block if block ~1 ~ ~ iron_block if block ~1 ~ ~1 iron_block if block ~-1 ~1 ~-1 iron_block if block ~-1 ~1 ~ iron_block if block ~-1 ~1 ~1 iron_block if block ~ ~1 ~1 iron_block if block ~1 ~1 ~-1 iron_block if block ~1 ~1 ~ iron_block if block ~1 ~1 ~1 iron_block run function gm4_smelteries:upgrade_machine_stand/north
execute if score $smeltery_placed gm4_machine_data matches 0 align xyz positioned ~0.5 ~0.5 ~0.5 run function gm4_smelteries:upgrade_machine_stand/default

# drop items from the original hopper
execute if score $smeltery_placed gm4_machine_data matches 0 if data storage gm4_smelteries:temp Items[-1] align xyz positioned ~0.5 ~1.1 ~0.5 run function gm4_smelteries:upgrade_machine_stand/drop_items
execute unless score $smeltery_placed gm4_machine_data matches 0 if data storage gm4_smelteries:temp Items[-1] align xyz positioned ~0.5 ~0.2 ~0.5 run function gm4_smelteries:upgrade_machine_stand/drop_items
data remove storage gm4_smelteries:temp Items
