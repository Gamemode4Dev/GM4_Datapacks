# Calculate the swing length by raycasting down until the next solid block
# @s = Player, placing a swing
# at swing placement player head ~ ~-1 ~
# run from gm4_swings:place/check

execute if block ~ ~ ~ #minecraft:blocks_motion run return fail

scoreboard players add $length gm4_swings.dummy 1

execute if score $length gm4_swings.dummy < $max_length gm4_swings.dummy positioned ~ ~-1 ~ run function gm4_swings:place/length_loop
