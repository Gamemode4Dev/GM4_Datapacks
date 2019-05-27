#firework assembler destruction
#@s - @e[type=armor_stand,tag=gm4_custom_crafter] at @s unless block ~ ~ ~ dropper
#called by main

loot spawn ~ ~.6 ~ loot firework_assemblers:blocks/firework_assembler
particle minecraft:block minecraft:tnt ~ ~1 ~ .1 .25 .1 .05 30 normal @a
particle minecraft:flash
playsound minecraft:entity.firework_rocket.blast player @a[distance=..20] ~ ~ ~ 100 1 1
kill @s
