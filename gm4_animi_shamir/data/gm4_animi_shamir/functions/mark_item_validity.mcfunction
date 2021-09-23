#@s = band is trying to apply to
#run from check_item_validity

execute store success score valid_item gm4_ml_data if entity @s[nbt={Item:{Count:1b}}]
