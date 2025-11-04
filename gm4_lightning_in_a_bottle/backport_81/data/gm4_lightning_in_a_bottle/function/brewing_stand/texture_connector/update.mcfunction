# @s = @e[type=item_display,tag=gm4_lightning_rod_texture_connector]
# at @s
# run from brewing_stand/texture_connector/process

# kill if unneeded
execute unless block ~ ~-0.1 ~ minecraft:brewing_stand run return run kill @s
execute unless block ~ ~ ~ #gm4_lightning_in_a_bottle:lightning_rod run return run kill @s

# update texture
scoreboard players set $texture_changed gm4_liab_data 0
# normal
execute unless score @s gm4_liab.oxidization matches 1 if block ~ ~ ~ minecraft:lightning_rod store success score $texture_changed gm4_liab_data run data modify entity @s item.components merge value {"minecraft:profile":"$texture_connector"}
execute if score $texture_changed gm4_liab_data matches 1 run return run scoreboard players set @s gm4_liab.oxidization 1
