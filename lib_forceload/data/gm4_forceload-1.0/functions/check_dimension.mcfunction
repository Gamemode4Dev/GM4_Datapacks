# @s = player who changed dimensions
# run from load, load_wait, and advancement "dimension_marking"

advancement revoke @s only gm4_forceload-1.0:dimension_marking

# initializes chunk if it's not loaded with the latest added block
execute unless block 29999998 1 7131 minecraft:command_block run function gm4_forceload-1.0:init_chunk

# spawns a dimension marker if one doesn't already exist in the dimension
execute unless entity @e[type=minecraft:area_effect_cloud,tag=gm4_dimension,distance=0..] run function gm4_forceload-1.0:mark_dimension
