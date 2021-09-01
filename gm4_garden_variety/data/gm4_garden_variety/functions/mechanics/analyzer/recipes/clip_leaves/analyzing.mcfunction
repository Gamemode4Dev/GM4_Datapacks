# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/update

# set analyzer speed
scoreboard players set $analyzing_time_required gm4_gv_analyze 7

# add increase to time required (with cap of 180s)
scoreboard players operation $analyzing_time_required gm4_gv_analyze += $analyzing_time_addition gm4_gv_analyze
execute if score $analyzing_time_required gm4_gv_analyze matches 181.. run scoreboard players set $analyzing_time_required gm4_gv_analyze 180

# analyze
function gm4_garden_variety:mechanics/analyzer/recipes/analyzing

# particle
particle item oak_leaves ~ ~1.2 ~ 0 0 0 .1 3

# complete
execute if score @s gm4_gv_analyze >= $analyzing_time_required gm4_gv_analyze run function gm4_garden_variety:mechanics/analyzer/recipes/clip_leaves/complete


