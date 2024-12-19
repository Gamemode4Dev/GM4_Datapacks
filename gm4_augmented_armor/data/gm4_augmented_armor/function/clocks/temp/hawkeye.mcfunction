# clock totem processing
# @s = unspecified
# at unspecified
# scheduled from armor/augment/type/hawkeye/apply
# scheduled from here
# run from main

scoreboard players set $keep_tick.hawkeye gm4_aa_keep_tick 0

execute as @e[type=#gm4_augmented_armor:arrow,tag=gm4_aa_hawkeye_arrow.process] run function gm4_augmented_armor:armor/augment/type/hawkeye/process_arrow

execute if score $keep_tick.hawkeye gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/hawkeye 1t
