# @s = band is trying to apply to
# run from check_item_validity

execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:golden_sword"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:diamond_sword"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:iron_sword"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:netherite_sword"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:stone_sword"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:wooden_sword"}}]
