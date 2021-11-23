# Checks if there are regular Thick Potions in the Brewing Stand
# positioned at brewing stand
# runs from brewing_stand/check_fuel

# store brewing stand Items
data modify storage gm4_lightning_in_a_bottle:temp/brewing_stand Items set from block ~ ~ ~ Items

# attempt to "brew" Bottles of Lightning
scoreboard players set $potion_success gm4_liab_data 0
execute if data storage gm4_lightning_in_a_bottle:temp/brewing_stand Items[{Slot:0b,id:"minecraft:lingering_potion",tag:{Potion:"minecraft:thick"}}] run function gm4_lightning_in_a_bottle:brewing_stand/lingering/slot_0
execute if data storage gm4_lightning_in_a_bottle:temp/brewing_stand Items[{Slot:1b,id:"minecraft:lingering_potion",tag:{Potion:"minecraft:thick"}}] run function gm4_lightning_in_a_bottle:brewing_stand/lingering/slot_1
execute if data storage gm4_lightning_in_a_bottle:temp/brewing_stand Items[{Slot:2b,id:"minecraft:lingering_potion",tag:{Potion:"minecraft:thick"}}] run function gm4_lightning_in_a_bottle:brewing_stand/lingering/slot_2

execute if data storage gm4_lightning_in_a_bottle:temp/brewing_stand Items[{Slot:0b,id:"minecraft:splash_potion",tag:{Potion:"minecraft:thick"}}] run function gm4_lightning_in_a_bottle:brewing_stand/splash/slot_0
execute if data storage gm4_lightning_in_a_bottle:temp/brewing_stand Items[{Slot:1b,id:"minecraft:splash_potion",tag:{Potion:"minecraft:thick"}}] run function gm4_lightning_in_a_bottle:brewing_stand/splash/slot_1
execute if data storage gm4_lightning_in_a_bottle:temp/brewing_stand Items[{Slot:2b,id:"minecraft:splash_potion",tag:{Potion:"minecraft:thick"}}] run function gm4_lightning_in_a_bottle:brewing_stand/splash/slot_2

execute if data storage gm4_lightning_in_a_bottle:temp/brewing_stand Items[{Slot:0b,id:"minecraft:potion",tag:{Potion:"minecraft:thick"}}] run function gm4_lightning_in_a_bottle:brewing_stand/slot_0
execute if data storage gm4_lightning_in_a_bottle:temp/brewing_stand Items[{Slot:1b,id:"minecraft:potion",tag:{Potion:"minecraft:thick"}}] run function gm4_lightning_in_a_bottle:brewing_stand/slot_1
execute if data storage gm4_lightning_in_a_bottle:temp/brewing_stand Items[{Slot:2b,id:"minecraft:potion",tag:{Potion:"minecraft:thick"}}] run function gm4_lightning_in_a_bottle:brewing_stand/slot_2
# cleanup
data remove storage gm4_lightning_in_a_bottle:temp/brewing_stand Items

# consume fuel, if succcess
execute if score $potion_success gm4_liab_data matches 1 run function gm4_lightning_in_a_bottle:brewing_stand/consume_fuel
