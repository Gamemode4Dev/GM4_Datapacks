# @s = brewing stand marker with a splash potion in slot 2
# run from finalize_potions/lingering/check_items

data modify entity @s data.gm4_brewing.insert set from storage gm4_brewing:temp Items[{Slot:2b}]

# use loot table to create new item
function #gm4_brewing:insert/lingering
execute if score $insert gm4_brewing_data matches -1 run data remove block ~ ~ ~ Items[{Slot:2b}]
execute store success score $insert gm4_brewing_data run data modify storage gm4_brewing:temp insert set from entity @e[type=item,nbt={Item:{tag:{gm4_custom_potion:1b}}},limit=1] Item

# insert item
data remove storage gm4_brewing:temp insert.tag.gm4_custom_potion
data modify storage gm4_brewing:temp insert.Slot set value 2b
execute if score $insert gm4_brewing_data matches 1.. run data modify block ~ ~ ~ Items[{Slot:2b}] set from storage gm4_brewing:temp insert

# clean up
scoreboard players reset $insert gm4_brewing_data
kill @e[type=item,nbt={Item:{tag:{gm4_custom_potion:1b}}}]
<<<<<<< HEAD
data remove entity @s data.gm4_brewing.insert
data remove storage gm4_brewing:temp insert
=======
data remove entity @s data.Insert
data remove storage gm4_brewing:temp Insert
>>>>>>> de24727f (This module allows the bottling of lightning, storing it for later use)