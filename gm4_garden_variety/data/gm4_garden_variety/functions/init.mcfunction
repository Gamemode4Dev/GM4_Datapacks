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

function gm4_garden_variety:init/static_variables
function gm4_garden_variety:init/fruiting_data
execute store result score world_seed gm4_gv_gen_data run seed

execute unless score garden_variety gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"garden_variety"}
scoreboard players set garden_variety gm4_modules 1

schedule function gm4_garden_variety:clock/1t 10t
schedule function gm4_garden_variety:clock/16t 11t
schedule function gm4_garden_variety:clock/1s 12t
schedule function gm4_garden_variety:clock/10s 13t

#$moduleUpdateList
