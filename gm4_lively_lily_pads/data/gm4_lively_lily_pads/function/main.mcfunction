
schedule function gm4_lively_lily_pads:main 16t

# execute as player
execute as @a at @s run function gm4_lively_lily_pads:player/as

# clean up
execute as @e[type=minecraft:block_display,tag=gm4_llp_display.1] at @s unless block ~ ~ ~ minecraft:lily_pad run function gm4_lively_lily_pads:mechanics/cleanup/kill
