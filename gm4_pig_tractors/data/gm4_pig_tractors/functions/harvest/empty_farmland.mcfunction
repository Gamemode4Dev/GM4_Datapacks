# Confirms the block type and selects it for harvesting
# @s = player on a pig tractor on farmland
# at @s
# run from advancement gm4_pig_tractors:block_detection/empty_farmland

# revoke
advancement revoke @s only gm4_pig_tractors:block_detection/empty_farmland

# place fresh crop
execute align xyz positioned ~0.5 ~ ~0.5 if block ~ ~ ~ #gm4_pig_tractors:replaceable run function gm4_pig_tractors:plant/select_type