# @s - @e[type=armor_stand,tag=gm4_blast_furnace] unless block ~ ~ ~ BLAST_FURNACE
# called by process

loot spawn ~ ~.6 ~ loot blast_furnaces:destroy_blast_furnace
kill @s
