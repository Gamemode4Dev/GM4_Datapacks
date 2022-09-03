# Give jump boost effects when holding poles, as long as the player is on a block (to simulate a cooldown)
# @s = player holding poles
# at @s
# run from main

execute at @a unless block ~ ~-0.2 ~ minecraft:air run effect give @s jump_boost 1 0 true