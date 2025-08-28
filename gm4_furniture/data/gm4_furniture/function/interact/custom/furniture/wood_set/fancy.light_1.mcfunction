# toggle lamp on and off
# @s = interacted furniture's item display
# at @s
# run from interact/custom/resolve_function

execute store success score $lit gm4_furniture_data if block ~ ~ ~ light[level=12]

execute if score $lit gm4_furniture_data matches 1 run setblock ~ ~ ~ light[level=0]
#execute if score $lit gm4_furniture_data matches 1 run data modify entity @s item.components."minecraft:item_model" set value ""

execute if score $lit gm4_furniture_data matches 0 run setblock ~ ~ ~ light[level=12]
#execute if score $lit gm4_furniture_data matches 0 run data modify entity @s item.components."minecraft:item_model" set value ""

## NEEDS MODELS
# | One with emissive texture, one without
