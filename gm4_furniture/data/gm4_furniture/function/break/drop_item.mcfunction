# drop destroyed furniture's item
# @s = furniture item display
# at @s
# run from break/destroy with @s item.components."minecraft:custom_data".gm4_furniture
# with {furniture_id}

$loot spawn ~.5 ~.25 ~.5 loot gm4_furniture:furniture/$(furniture_id)
execute if score $furniture_color gm4_furniture_data matches 1.. positioned ~.5 ~.25 ~.5 store result entity @e[type=item,limit=1,sort=nearest] Item.components."minecraft:dyed_color" int 1 run scoreboard players get $furniture_color gm4_furniture_data
