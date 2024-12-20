# resolve paintbrush being equpped on a horse by right clicking
# @s = player that right clicked a horse with a paintbrush
# at @s
advancement revoke @s only gm4_furniture:use_paintbrush_on_horse
say t
tag @s add gm4_furniture_target
execute as @e[type=horse,distance=..12] if data entity @s body_armor_item.components."minecraft:custom_data"{gm4_furniture:"paintbrush"} run function gm4_furniture:technical/paintbrush/return_from_horse
tag @s remove gm4_furniture_target
