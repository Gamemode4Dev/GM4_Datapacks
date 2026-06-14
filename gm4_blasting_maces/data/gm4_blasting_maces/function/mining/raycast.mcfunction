# Steps along the look direction until it hits a solid block
# @s = player
# at the current ray position, with the player's rotation
# run from gm4_blasting_maces:player/release and self

# stop at the first solid block
execute unless block ~ ~ ~ #gm4_blasting_maces:passable run return run function gm4_blasting_maces:mining/store_hit

# otherwise step forward and keep going
scoreboard players remove $ray gm4_blast_data 1
execute if score $ray gm4_blast_data matches 0.. positioned ^ ^ ^0.1 run function gm4_blasting_maces:mining/raycast
