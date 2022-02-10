# @s = players holding a tinker tool
# at @s
# run from gm4_metallurgy:shamir_in_hand

scoreboard players set $success gm4_ml_data 0

execute if entity @s[predicate=gm4_tinker_shamir:holding_shovel] run function gm4_tinker_shamir:tool/shovel
execute unless score $success gm4_ml_data matches 1.. if entity @s[predicate=gm4_tinker_shamir:holding_pickaxe] run function gm4_tinker_shamir:tool/pickaxe
execute unless score $success gm4_ml_data matches 1.. if entity @s[predicate=gm4_tinker_shamir:holding_sword] run function gm4_tinker_shamir:tool/sword
execute unless score $success gm4_ml_data matches 1.. if entity @s[predicate=gm4_tinker_shamir:holding_hoe] run function gm4_tinker_shamir:tool/hoe

scoreboard players reset $success gm4_ml_data
