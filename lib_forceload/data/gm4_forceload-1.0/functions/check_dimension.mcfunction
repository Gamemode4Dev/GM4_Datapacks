# @s = player who changed dimensions
# run from load_wait and advancement "dimension_marking"

advancement revoke @s only gm4_forceload-1.0:dimension_marking

# spawns a dimension marker if one doesn't already exist in the dimension
execute unless entity @e[type=minecraft:area_effect_cloud,tag=gm4_dimension,distance=0..] run function gm4_forceload-1.0:mark_dimension
