# @s = players holding a tinker tool
# at @s
# run from gm4_metallurgy:shamir_in_hand

execute if entity @s[predicate=gm4_tinker_shamir:holding_shovel] run function gm4_tinker_shamir:compact/shovel
execute if entity @s[predicate=gm4_tinker_shamir:holding_pickaxe] run function gm4_tinker_shamir:compact/pickaxe
execute if entity @s[predicate=gm4_tinker_shamir:holding_sword] run function gm4_tinker_shamir:compact/sword
execute if entity @s[predicate=gm4_tinker_shamir:holding_hoe] run function gm4_tinker_shamir:compact/hoe
