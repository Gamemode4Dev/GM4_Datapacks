# @s = raycast AEC
# at start location
# run from player/place_soul_in_a_lantern

scoreboard players set gm4_ray_counter gm4_count 0
execute as @s at @s run function gm4_soul_fragments:player/ray/move

# detect blocks
execute at @s align xyz unless block ~ ~ ~ #gm4_soul_fragments:air at @s run function gm4_soul_fragments:player/ray/summon

# kill ray
kill @s
