# @s - @e[type=armor_stand,tag=gm4_pulverizer] unless block ~ ~ ~ hopper
# called by main

function #gm4_pulverizers:destroy

loot spawn ~ ~.6 ~ loot gm4_pulverizers:destroy_pulverizer
particle block iron_block ~ ~1 ~ .1 .25 .1 .05 30 normal @a
kill @s
