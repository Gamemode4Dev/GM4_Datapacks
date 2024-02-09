# Toggles the setting which determines whether doors will auto close after the player goes through them
# @s = player that toggled their setting
# at world spawn
# ran from gm4_double_doors:main when the player has ran /trigger

scoreboard players set @s gm4_double_doors_auto_toggle_settings_trigger 1
execute unless entity @s[tag=gm4_block_auto_toggle] run scoreboard players set @s gm4_double_doors_auto_toggle_settings_trigger 0

execute if score @s gm4_double_doors_auto_toggle_settings_trigger matches 1 run tag @s remove gm4_block_auto_toggle
execute if score @s gm4_double_doors_auto_toggle_settings_trigger matches 0 run tag @s add gm4_block_auto_toggle

scoreboard players set @s gm4_double_doors_auto_toggle_settings_trigger 0