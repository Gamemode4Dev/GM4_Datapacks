# Selects a block to be tilled and tills it
# @s = player on a pig tractor in a replaceable block
# at @s
# run from advancement gm4_pig_tractors:block_detection/air

# revoke
advancement revoke @s only gm4_pig_tractors:block_detection/air

# check for targeted block
execute align xyz positioned ~0.5 ~-1 ~0.5 if block ~ ~ ~ #gm4_pig_tractors:tillable if block ~ ~1 ~ #gm4_pig_tractors:replaceable run function gm4_pig_tractors:till/select_type
