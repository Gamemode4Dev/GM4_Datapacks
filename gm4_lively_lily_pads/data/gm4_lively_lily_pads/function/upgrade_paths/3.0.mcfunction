# upgrade path from pre-gm4 LLP
# @s = player
# at @s

# kill old not useful
execute as @e[type=minecraft:interaction,tag=lilyPadInt] run kill @s
execute as @e[type=minecraft:block_display,tag=lilyPadLight2] run kill @s

# upgrade remaining
execute as @e[type=minecraft:block_display,tag=lilyPadLight] at @s run function gm4_lively_lily_pads:upgrade_paths/3.0/update_legacy_display
