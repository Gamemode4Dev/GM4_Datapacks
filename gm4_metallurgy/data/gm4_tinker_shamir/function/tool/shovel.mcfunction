# @s = player holding tinker shovel
# at @s
# run from gm4_tinker_shamir:active

# check for compacting operations
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/snowball run function gm4_tinker_shamir:compact/snowball
execute if score $success gm4_ml_data matches 0 if predicate gm4_tinker_shamir:has_full_stack/clay_ball run function gm4_tinker_shamir:compact/clay_ball
