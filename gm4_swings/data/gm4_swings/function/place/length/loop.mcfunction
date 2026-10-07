execute if block ~ ~ ~ #minecraft:blocks_motion run return fail

scoreboard players add $length gm4_swings.dummy 1

execute if score $length gm4_swings.dummy < $max_length gm4_swings.dummy positioned ~ ~-1 ~ run function gm4_swings:place/length/loop