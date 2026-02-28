# Destroys a single block at the current position if it is breakable and not unbreakable
# @s = none
# at block position
# run from gm4_blasting_maces:mining/*

# destroy block and increment counter (must be in the whitelist AND not in the blocklist)
scoreboard players set $blast_success gm4_blast_data 0
execute if block ~ ~ ~ #gm4_blasting_maces:breakable unless block ~ ~ ~ #gm4_blasting_maces:unbreakable store success score $blast_success gm4_blast_data run setblock ~ ~ ~ air destroy
scoreboard players operation $blast_count gm4_blast_data += $blast_success gm4_blast_data
