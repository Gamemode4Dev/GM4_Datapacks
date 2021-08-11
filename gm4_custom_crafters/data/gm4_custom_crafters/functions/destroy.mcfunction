#@s = @e[type=armor_stand,tag=gm4_custom_crafter] at @s unless block ~ ~ ~ dropper
#Run from main

function #gm4_custom_crafters:destroy

loot spawn ~ ~.6 ~ loot gm4_custom_crafters:blocks/custom_crafter
particle block crafting_table ~ ~1 ~ .1 .25 .1 .05 30 normal @a
kill @s
