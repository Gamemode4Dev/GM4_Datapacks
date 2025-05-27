# @s = player holding tinker pickaxe
# at @s
# run from gm4_tinker_shamir:active

# check for compacting operations
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/netherite_ingot run function gm4_tinker_shamir:compact/netherite_ingot
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/emerald run function gm4_tinker_shamir:compact/emerald
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/diamond run function gm4_tinker_shamir:compact/diamond
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/redstone run function gm4_tinker_shamir:compact/redstone
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/coal run function gm4_tinker_shamir:compact/coal
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/lapis_lazuli run function gm4_tinker_shamir:compact/lapis_lazuli
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/iron_ingot run function gm4_tinker_shamir:compact/iron_ingot
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/gold_ingot run function gm4_tinker_shamir:compact/gold_ingot
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/iron_nugget run function gm4_tinker_shamir:compact/iron_nugget
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/gold_nugget run function gm4_tinker_shamir:compact/gold_nugget
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/copper_ingot run function gm4_tinker_shamir:compact/copper_ingot
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/raw_iron run function gm4_tinker_shamir:compact/raw_iron
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/raw_gold run function gm4_tinker_shamir:compact/raw_gold
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/raw_copper run function gm4_tinker_shamir:compact/raw_copper
