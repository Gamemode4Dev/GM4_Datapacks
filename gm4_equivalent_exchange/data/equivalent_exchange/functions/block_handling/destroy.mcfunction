#@s = @e[type=armor_stand,tag=gm4_alchemical_crafter] at @s unless block ~ ~ ~ dropper
#Run from main

loot spawn ~ ~.6 ~ loot equivalent_exchange:destroy_alchemical_crafter
particle block redstone_block ~ ~1 ~ .1 .25 .1 .05 30 normal @a
kill @s
