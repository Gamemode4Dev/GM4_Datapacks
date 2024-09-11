# Confirms the block type and selects it for harvesting
# @s = player on a pig tractor on farmland
# at @s
# run from advancement gm4_pig_tractors:block_detection/wheat

# revoke
advancement revoke @s only gm4_pig_tractors:block_detection/wheat

# check for targeted block
execute align xyz positioned ~0.5 ~ ~0.5 if block ~ ~ ~ minecraft:wheat[age=7] run function gm4_pig_tractors:harvest/block/wheat
