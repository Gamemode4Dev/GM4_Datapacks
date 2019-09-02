#@s - @e[type=armor_stand,tag=gm4_bf_output] unless block ~ ~ ~ BLAST_FURNACE
#called by processes

loot spawn ~ ~.6 ~ loot blast_furnaces:destroy_blast_furnace
particle block furnace[lit=true] ~ ~1 ~ .1 .25 .1 .05 30 normal @a
kill @s
