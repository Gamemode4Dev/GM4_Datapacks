# converts nbt values into scoreboard values
# run from gm4_garden_variety:mechanics/custom_sapling/destroy
# run from gm4_garden_variety:mechanics/custom_sapling/generate_tree
# run from gm4_garden_variety:mechanics/tree_generation/pre_clearance_checker


# reset scores
scoreboard players reset * gm4_gv_nbt_data

# clearance checker (debug)
execute if data storage gm4_garden_variety:convert/to_scores input.debug{clearance_checker:0b} run scoreboard players set $clearance_checker gm4_gv_nbt_data 0

# always mutate (debug)
execute if data storage gm4_garden_variety:convert/to_scores input.debug{always_mutate:1b} run scoreboard players set $always_mutate gm4_gv_nbt_data 1

# name tag
execute if data storage gm4_garden_variety:convert/to_scores input{name_tag:1b} run scoreboard players set $name_tag gm4_gv_nbt_data 1

# mutations
function #gm4_garden_variety:utility/convert/gv_nbt_to_scores

# reset storage
data remove storage gm4_garden_variety:convert/to_scores input
