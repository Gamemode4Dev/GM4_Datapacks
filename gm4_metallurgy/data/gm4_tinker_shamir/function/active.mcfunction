# @s = players holding a tinker tool
# at @s
# run from gm4_metallurgy:shamir_in_hand

scoreboard players set $success gm4_ml_data 0

execute if score $success gm4_ml_data matches 0 if items entity @s weapon.mainhand #minecraft:shovels run function gm4_tinker_shamir:tool/shovel
execute if score $success gm4_ml_data matches 0 if items entity @s weapon.mainhand #minecraft:pickaxes run function gm4_tinker_shamir:tool/pickaxe
execute if score $success gm4_ml_data matches 0 if items entity @s weapon.mainhand #minecraft:swords run function gm4_tinker_shamir:tool/sword
execute if score $success gm4_ml_data matches 0 if items entity @s weapon.mainhand #minecraft:hoes run function gm4_tinker_shamir:tool/hoe

scoreboard players reset $success gm4_ml_data
