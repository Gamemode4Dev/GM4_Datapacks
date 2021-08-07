# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/update

# set analyzer speed
scoreboard players set $analyzing_time_required gm4_gv_analyze 5

# calculate time required increase by 2 per item (with offset)
scoreboard players set $analyzing_time_addition gm4_gv_analyze 1
scoreboard players operation $analyzing_time_addition gm4_gv_analyze *= $slot_1_amount gm4_gv_analyze 
scoreboard players remove $analyzing_time_addition gm4_gv_analyze 1

# add increase to time required (with cap of 60s)
scoreboard players operation $analyzing_time_required gm4_gv_analyze += $analyzing_time_addition gm4_gv_analyze
execute if score $analyzing_time_required gm4_gv_analyze matches 61.. run scoreboard players set $analyzing_time_required gm4_gv_analyze 60

# analyze
function gm4_garden_variety:arborist/analyzer/recipes/analyzing

# particle
particle item bone_meal ~ ~1.2 ~ 0 0 0 .1 3

# complete
execute if score @s gm4_gv_analyze >= $analyzing_time_required gm4_gv_analyze run function gm4_garden_variety:arborist/analyzer/recipes/convert_sapling/complete


