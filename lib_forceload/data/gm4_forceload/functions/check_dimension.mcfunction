# @s = player who changed dimensions
# run from load_wait and advancement "dimension_marking"

advancement revoke @s only gm4_forceload:dimension_marking

# spawns a dimension marker if one doesn't already exist in the dimension
execute as @e[type=area_effect_cloud,tag=gm4_dimension] at @s run function gm4_forceload:upgrade_marker
execute store success score $initialized gm4_dimension if block 29999998 1 7133 birch_wall_sign
execute if score $initialized gm4_dimension matches 0 run function gm4_forceload:mark_dimension
