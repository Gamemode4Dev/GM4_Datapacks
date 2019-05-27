#firework assembler checks
#@s - firework assembler
#called by firework_assemblers:main

#firework assembler crafter destruction
execute unless block ~ ~ ~ minecraft:dropper run function firework_assemblers:destroy
#maintenance
data merge entity @s {Fire:2000}
#recipes
execute if block ~ ~ ~ minecraft:dropper[triggered=false]{Items:[{}]} run function firework_assemblers:recipe_validity_check
