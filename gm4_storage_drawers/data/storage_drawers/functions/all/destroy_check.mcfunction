#run from pulse_check
#@s = as and at drawer with base block destroyed

execute if score @s gm4_sd_amount matches 2305.. run tag @s add gm4_sd_filled
execute if entity @s[tag=gm4_sd_filled] run setblock ^ ^ ^-1 minecraft:white_bed keep
execute if entity @s[tag=gm4_sd_filled] run title @p[distance=..3] actionbar "Drawer can't contain more that a full inventory when destroyed!"

execute if entity @s[tag=!gm4_sd_filled] run function storage_drawers:all/destory

tag @s remove gm4_sd_filled