# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/update

# set analyzer speed
scoreboard players set $analyzing_time_required gm4_gv_analyzer 7
execute if data storage gm4_garden_variety:analyzer Items[{Slot:0b}].tag.gm4_garden_variety.lore{show_mutations:1b} run scoreboard players add $analyzing_time_required gm4_gv_analyzer 2

# calculate time required increase by 2 per item (with offset)
scoreboard players set $analyzing_time_addition gm4_gv_analyzer 2
scoreboard players operation $analyzing_time_addition gm4_gv_analyzer *= $slot_1_amount gm4_gv_analyzer 
scoreboard players remove $analyzing_time_addition gm4_gv_analyzer 2

# add increase to time required (with cap of 180s)
scoreboard players operation $analyzing_time_required gm4_gv_analyzer += $analyzing_time_addition gm4_gv_analyzer
execute if score $analyzing_time_required gm4_gv_analyzer matches 181.. run scoreboard players set $analyzing_time_required gm4_gv_analyzer 180

# analyze
function gm4_garden_variety:mechanics/analyzer/recipes/analyzing

# particle
particle item name_tag ~ ~1.2 ~ 0 0 0 .1 3

# complete
execute if score @s gm4_gv_analyzer >= $analyzing_time_required gm4_gv_analyzer run function gm4_garden_variety:mechanics/analyzer/recipes/name_tag_sapling/complete


