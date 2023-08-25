
advancement revoke @s only gm4_furniture:use_paintbrush_on_horse

tag @s add gm4_furniture_target
execute as @e[type=horse,distance=..8] if data entity @s ArmorItems[2].tag{gm4_furniture:"paintbrush"} store success score $armor_replaced gm4_furniture_data run item replace entity @s horse.armor with air
execute if score $armor_replaced gm4_furniture_data matches 1 run item replace entity @s weapon.mainhand with air
execute if score $armor_replaced gm4_furniture_data matches 1 run loot replace entity @s weapon.mainhand loot gm4_furniture:items/paintbrush
scoreboard players reset $armor_replaced gm4_furniture_data
tag @s remove gm4_furniture_target
