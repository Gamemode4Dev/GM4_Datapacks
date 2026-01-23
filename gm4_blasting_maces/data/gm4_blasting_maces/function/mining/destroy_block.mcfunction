# Destroys a single block at the current position if it is breakable and not unbreakable
# @s = none
# at block position
# run from gm4_blasting_maces:mining/*

# destroy block and increment counter (must be in the whitelist AND not in the blocklist)
execute if block ~ ~ ~ #gm4_blasting_maces:breakable unless block ~ ~ ~ #gm4_blasting_maces:unbreakable run scoreboard players add $blast_count gm4_blast_data 1
execute if block ~ ~ ~ #gm4_blasting_maces:breakable unless block ~ ~ ~ #gm4_blasting_maces:unbreakable run setblock ~ ~ ~ air destroy
