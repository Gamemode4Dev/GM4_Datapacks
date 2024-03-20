# 1 tick clock for block display growth
# @s = unspecified
# at unspecified
# schedule from spell_trident/place_blocks/initialize
# schedule from here

execute as @e[type=block_display,tag=gm4_hy_builder.growing] at @s run function gm4_hydromancy:spell_trident/builder/place_blocks/process_block

execute if entity @e[type=block_display,tag=gm4_hy_builder.growing] run schedule function gm4_hydromancy:spell_trident/builder/place_blocks/clock 1t
