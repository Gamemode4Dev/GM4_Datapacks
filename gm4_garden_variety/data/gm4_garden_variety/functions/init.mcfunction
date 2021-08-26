# generation
scoreboard objectives add gm4_gv_math_num dummy
scoreboard objectives add gm4_gv_gen_data dummy
scoreboard objectives add gm4_gv_tree_type dummy
# mutations
scoreboard objectives add gm4_gv_nbt_data dummy
# arborist
scoreboard objectives add gm4_gv_arborist dummy
scoreboard objectives add gm4_gv_trades dummy
scoreboard objectives add gm4_gv_job_id dummy
scoreboard objectives add gm4_gv_prev_xp dummy
# analyzer
scoreboard objectives add gm4_gv_analyze dummy
scoreboard objectives add gm4_gv_analyze_p dummy
# research book
scoreboard objectives add gm4_gv_research dummy

# initial scoreboards
function gm4_garden_variety:init/static_variables
function gm4_garden_variety:init/fruiting_data
function gm4_garden_variety:init/research_book_pages
execute store result score $world_seed gm4_gv_gen_data run seed

# clocks
schedule function gm4_garden_variety:clock/tick 10t
schedule function gm4_garden_variety:clock/process_leaves 11t
schedule function gm4_garden_variety:clock/process_analyzer 12t
schedule function gm4_garden_variety:clock/process_arborist 13t

execute unless score garden_variety gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"garden_variety"}
scoreboard players set garden_variety gm4_modules 1

#$moduleUpdateList
