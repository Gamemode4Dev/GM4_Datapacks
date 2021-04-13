# Decides what to do when tilling a block
# @s = player on a pig tractor
# at block below the pig, aligned to block center in xz and block bottom in z
# run from gm4_pig_tractors:till/select_position

# destroy top block (this is a replaceable block, by function call)
setblock ~ ~1 ~ air destroy

# coarse dirt
execute if block ~ ~ ~ coarse_dirt run function gm4_pig_tractors:till/blocks/coarse_dirt

# dirt
execute if block ~ ~ ~ dirt run function gm4_pig_tractors:till/blocks/dirt

# grass
execute if block ~ ~ ~ grass_block run function gm4_pig_tractors:till/blocks/grass_block

# award advancement
advancement grant @s only gm4:pig_tractors
