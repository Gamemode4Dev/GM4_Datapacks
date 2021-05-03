# @s = armor stand in custom crafter
# called from main

# crafter destruction
execute unless block ~ ~ ~ dropper run function gm4_custom_crafters:destroy

# crafter maintenance
data merge entity @s {Fire:2000}

# recipes
execute if block ~ ~ ~ dropper[triggered=false]{Items:[{}]} run function gm4_custom_crafters:recipe_validity_check
