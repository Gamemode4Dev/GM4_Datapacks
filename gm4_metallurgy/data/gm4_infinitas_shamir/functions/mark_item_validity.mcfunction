# @s = band is trying to apply to
# run from check_item_validity

execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:axolotl_bucket"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:bucket"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:cod_bucket"}}]
execute unless score valid_item gm4_ml_data matches 1 if score $lava_infinitas gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:lava_bucket"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:milk_bucket"}}]
execute unless score valid_item gm4_ml_data matches 1 if score $powder_snow_infinitas gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:powder_snow_bucket"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:pufferfish_bucket"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:salmon_bucket"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:tadpole_bucket"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:tropical_fish_bucket"}}]
execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:water_bucket"}}]
