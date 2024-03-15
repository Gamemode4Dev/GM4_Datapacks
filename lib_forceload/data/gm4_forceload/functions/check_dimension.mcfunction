# @s = player who changed dimensions
# run from load_wait and advancement "dimension_marking"

advancement revoke @s only gm4_forceload:dimension_marking

# spawns a dimension marker if one doesn't already exist in the dimension
execute store success score $initialized gm4_dimension if block 29999998 1 7133 birch_wall_sign
execute if score $initialized gm4_dimension matches 0 run function gm4_forceload:mark_dimension
