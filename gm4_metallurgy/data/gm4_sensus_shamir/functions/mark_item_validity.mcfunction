#@s = band is trying to apply to
#run from check_item_validity

execute unless score valid_item gm4_ml_data matches 1 store success score valid_item gm4_ml_data if entity @s[nbt={Item:{id:"minecraft:compass"}}]
