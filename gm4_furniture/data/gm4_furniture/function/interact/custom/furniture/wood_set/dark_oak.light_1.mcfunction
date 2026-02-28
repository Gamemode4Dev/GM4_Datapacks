# toggle lamp on and off
# @s = interacted furniture's item display
# at @s
# run from interact/custom/resolve_function

execute store success score $lit gm4_furniture_data if block ~ ~ ~ light[level=12]

execute if score $lit gm4_furniture_data matches 1 run setblock ~ ~ ~ light[level=0]
execute if score $lit gm4_furniture_data matches 1 run data modify entity @s item.components merge value \
  {"minecraft:item_model":"gm4_furniture:wood_set/dark_oak/light_1","minecraft:custom_data":{gm4_furniture:{block_id:"light[level=0]"}}}

execute if score $lit gm4_furniture_data matches 0 run setblock ~ ~ ~ light[level=12]
execute if score $lit gm4_furniture_data matches 0 run data modify entity @s item.components merge value \
  {"minecraft:item_model":"gm4_furniture:wood_set/dark_oak/light_1","minecraft:custom_data":{gm4_furniture:{block_id:"light[level=12]"}}}

playsound block.dispenser.fail block @a[distance=..16]

## NEEDS MODELS
# | One with emissive texture, one without
