# @s = armor stand in custom crafter
# called from main

# crafter destruction
execute unless block ~ ~ ~ dropper run function gm4_custom_crafters:destroy

# crafter maintenance
# 1.18 NOTE; This 16->17 backward compatibility may be removed.
data merge entity @s {HasVisualFire:1}

# recipes
execute if block ~ ~ ~ dropper[triggered=false]{Items:[{}]} run function gm4_custom_crafters:recipe_validity_check
