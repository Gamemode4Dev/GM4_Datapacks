# @s = brewing stand marker with a splash potion in slot 0
# run from finalize_potions/lingering/check_items

data modify entity @s data.gm4_brewing.insert set from storage gm4_brewing:temp Items[{Slot:0b}]

# use loot table to create new item
function #gm4_brewing:insert/lingering
execute if score $insert gm4_brewing_data matches -1 run data remove block ~ ~ ~ Items[{Slot:0b}]
execute store success score $insert gm4_brewing_data run data modify storage gm4_brewing:temp insert set from entity @e[type=item,nbt={Item:{tag:{gm4_custom_potion:1b}}},limit=1] Item

# insert item
data remove storage gm4_brewing:temp insert.tag.gm4_custom_potion
data modify storage gm4_brewing:temp insert.Slot set value 0b
execute if score $insert gm4_brewing_data matches 1.. run data modify block ~ ~ ~ Items[{Slot:0b}] set from storage gm4_brewing:temp insert 

# clean up
scoreboard players reset $insert gm4_brewing_data
kill @e[type=item,nbt={Item:{tag:{gm4_custom_potion:1b}}}]
data remove entity @s data.gm4_brewing.insert
data remove storage gm4_brewing:temp insert
