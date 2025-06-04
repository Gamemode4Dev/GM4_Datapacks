# cleans up
# @s = type=block_display, tag=gm4_llp_display.1
# at @s
# run from main

# TODO, DROP ITEM

kill @e[type=minecraft:interaction,tag=gm4_llp_change_rcd,limit=1,distance=..0.1]
# also kills @s
kill @e[type=minecraft:block_display,tag=gm4_llp_display,distance=..0.1]
