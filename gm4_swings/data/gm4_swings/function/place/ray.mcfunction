execute if block ~ ~ ~ #gm4_swings:player_heads if data block ~ ~ ~ components."minecraft:custom_data".gm4_swings align xyz positioned ~0.5 ~ ~0.5 run return run function gm4_swings:place/check
execute positioned ~ ~1 ~ if block ~ ~ ~ #gm4_swings:player_heads if data block ~ ~ ~ components."minecraft:custom_data".gm4_swings align xyz positioned ~0.5 ~ ~0.5 run return run function gm4_swings:place/check
execute positioned ~ ~-1 ~ if block ~ ~ ~ #gm4_swings:player_heads if data block ~ ~ ~ components."minecraft:custom_data".gm4_swings align xyz positioned ~0.5 ~ ~0.5 run return run function gm4_swings:place/check
execute positioned ~1 ~ ~ if block ~ ~ ~ #gm4_swings:player_heads if data block ~ ~ ~ components."minecraft:custom_data".gm4_swings align xyz positioned ~0.5 ~ ~0.5 run return run function gm4_swings:place/check
execute positioned ~-1 ~ ~ if block ~ ~ ~ #gm4_swings:player_heads if data block ~ ~ ~ components."minecraft:custom_data".gm4_swings align xyz positioned ~0.5 ~ ~0.5 run return run function gm4_swings:place/check
execute positioned ~ ~ ~1 if block ~ ~ ~ #gm4_swings:player_heads if data block ~ ~ ~ components."minecraft:custom_data".gm4_swings align xyz positioned ~0.5 ~ ~0.5 run return run function gm4_swings:place/check
execute positioned ~ ~ ~-1 if block ~ ~ ~ #gm4_swings:player_heads if data block ~ ~ ~ components."minecraft:custom_data".gm4_swings align xyz positioned ~0.5 ~ ~0.5 run return run function gm4_swings:place/check

scoreboard players add $raycast_distance gm4_swings.dummy 1

execute if score $raycast_distance gm4_swings.dummy < $reach gm4_swings.dummy positioned ^ ^ ^0.5 run function gm4_swings:place/ray