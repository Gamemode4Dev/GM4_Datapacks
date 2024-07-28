# swap sword material if player armor has changed
# @s = player wearing armor
# at unspecified
# run from armor/modifier/type/sword_ring/find_sword

execute unless score $sword_material gm4_ce_data matches 2.. run data modify entity @s item.id set value "wooden_sword"
execute if score $sword_material gm4_ce_data matches 2 run data modify entity @s item.id set value "stone_sword"
execute if score $sword_material gm4_ce_data matches 3 run data modify entity @s item.id set value "iron_sword"
execute if score $sword_material gm4_ce_data matches 4 run data modify entity @s item.id set value "golden_sword"
execute if score $sword_material gm4_ce_data matches 5 run data modify entity @s item.id set value "diamond_sword"
execute if score $sword_material gm4_ce_data matches 6 run data modify entity @s item.id set value "netherite_sword"

# store material for damage calculation
scoreboard players operation @s gm4_ce_data = $sword_material gm4_ce_data
