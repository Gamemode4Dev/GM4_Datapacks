# Confirms the block type and selects it for planting
# @s = player on a pig tractor on farmland
# at @s
# run from advancement gm4_pig_tractors:plant_seed

# revoke
advancement revoke @s only gm4_pig_tractors:plant_seed

# check if player is holding seeds in mainhand
execute if items entity @s weapon.mainhand #gm4_pig_tractors:seeds run return run function gm4_pig_tractors:plant/use_mainhand_seeds

# check if player is holding seeds in offhand
execute if items entity @s weapon.offhand #gm4_pig_tractors:seeds run return run function gm4_pig_tractors:plant/use_offhand_seeds

# otherwise, use predefined order
function gm4_pig_tractors:plant/use_predefined_order
