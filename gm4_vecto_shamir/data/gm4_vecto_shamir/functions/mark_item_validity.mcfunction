# @s = band is trying to apply to
# at @s
# run from check_item_validity

execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:leather_boots"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:chainmail_boots"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_boots"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_boots"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_boots"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:netherite_boots"}}]
