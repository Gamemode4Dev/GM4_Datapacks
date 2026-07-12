# Destroys a single block at the current position unless it is unbreakable
# @s = none
# at block position
# run from gm4_blasting_maces:mining/plane_3x3

# destroy any block that isn't unbreakable, and count it
scoreboard players set $success gm4_blast_data 0
execute unless block ~ ~ ~ #gm4_blasting_maces:unbreakable store success score $success gm4_blast_data run setblock ~ ~ ~ air destroy
scoreboard players operation $count gm4_blast_data += $success gm4_blast_data
