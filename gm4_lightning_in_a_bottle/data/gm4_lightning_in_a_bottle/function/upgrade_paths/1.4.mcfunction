# upgrades armor-stand gm4_lightning_rod_texture_connector's to item_displays
# @s = player
# at @s
# run via upgrade paths util

execute as @e[type=armor_stand,tag=gm4_lightning_rod_texture_connector] at @s align xyz run function gm4_lightning_in_a_bottle:brewing_stand/texture_connector/summon
kill @e[type=armor_stand,tag=gm4_lightning_rod_texture_connector]
