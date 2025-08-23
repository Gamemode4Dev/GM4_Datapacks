# @s = player holding tinker shovel
# at @s
# run from gm4_tinker_shamir:active

# check for compacting operations
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/melon_slice run function gm4_tinker_shamir:compact/melon_slice
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/wheat run function gm4_tinker_shamir:compact/wheat
