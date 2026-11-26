# @s = player on a pig tractor on farmland
# at @s
# run from advancement gm4_pig_tractors:harvest_crop

# revoke
advancement revoke @s only gm4_pig_tractors:harvest_crop

# check for harvested block
execute if block ~ ~ ~ minecraft:beetroots[age=3] run return run function gm4_pig_tractors:harvest/block/beetroots
execute if block ~ ~ ~ minecraft:carrots[age=7] run return run function gm4_pig_tractors:harvest/block/carrots
execute if block ~ ~ ~ minecraft:potatoes[age=7] run return run function gm4_pig_tractors:harvest/block/potatoes
execute if block ~ ~ ~ minecraft:wheat[age=7] run return run function gm4_pig_tractors:harvest/block/wheat
