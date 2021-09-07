# @s = gm4_gv_analyzer that has been broken
# run from gm4_garden_variety:custom_crafters/update

# set analyzer speed
scoreboard players set $analyzing_time_required gm4_gv_analyze 4
execute if data storage gm4_garden_variety:analyzer Items[{Slot:0b}].tag.gm4_garden_variety.lore{show_mutations:1b} run scoreboard players add $analyzing_time_required gm4_gv_analyze 2
execute if data storage gm4_garden_variety:analyzer Items[{Slot:1b}].tag.gm4_garden_variety{name_tag:1b} run scoreboard players remove $analyzing_time_required gm4_gv_analyze 2


# analyze
function gm4_garden_variety:mechanics/analyzer/recipes/analyzing

# particle
particle item paper ~ ~1.2 ~ 0 0 0 .1 3

# complete
execute if score @s gm4_gv_analyze >= $analyzing_time_required gm4_gv_analyze run function gm4_garden_variety:mechanics/analyzer/recipes/paper_report/complete


