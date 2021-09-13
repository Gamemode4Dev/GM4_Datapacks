# analyzes the recipe
# @s = @s[tag=gm4_gv_analyzer]
# at @s
# run from gm4_garden_variety:mechanics/analyzer/recipes/paper_report/check


# set analyzer speed
scoreboard players set $analyzing_time_required gm4_gv_analyzer 4
execute if data storage gm4_garden_variety:analyzer Items[{Slot:0b}].tag.gm4_garden_variety.lore{show_mutations:1b} run scoreboard players add $analyzing_time_required gm4_gv_analyzer 2
execute if data storage gm4_garden_variety:analyzer Items[{Slot:1b}].tag.gm4_garden_variety{name_tag:1b} run scoreboard players remove $analyzing_time_required gm4_gv_analyzer 2


# analyze
function gm4_garden_variety:mechanics/analyzer/recipes/analyzing

# particle
particle item paper ~ ~1.2 ~ 0 0 0 .1 3

# complete
execute if score @s gm4_gv_analyzer >= $analyzing_time_required gm4_gv_analyzer run function gm4_garden_variety:mechanics/analyzer/recipes/paper_report/complete
