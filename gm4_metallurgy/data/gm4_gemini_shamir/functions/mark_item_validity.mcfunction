# @s = band is trying to apply to
# run from check_item_validity

execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:netherite_hoe"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_hoe"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_hoe"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_hoe"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:stone_hoe"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:wooden_hoe"}}]
