scoreboard objectives add gm4_lt_value dummy
scoreboard objectives add gm4_lt_max dummy
scoreboard objectives add gm4_lt_prior_val dummy
#scoreboard objectives add gm4_lt_disp_max
scoreboard objectives add gm4_lt_disp_val dummy
scoreboard objectives add gm4_lt_util dummy

execute unless score liquid_tanks gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Liquid Tanks"}
scoreboard players set liquid_tanks gm4_modules 1

schedule function gm4_liquid_tanks:main 1t
schedule function gm4_liquid_tanks:tick 1t

# guidebook
summon marker ~ 4064.873907663935 ~ {CustomName:'"gm4_standard_liquids_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"liquid_tanks",id:"standard_liquids",page_count:1,line_count:1,module_name:"Standard Liquids"}}
summon marker ~ 2544.348486877165 ~ {CustomName:'"gm4_liquid_tanks_guide"',Tags:["gm4_guide"],data:{type:"base",expansions:[],id:"liquid_tanks",page_count:1,line_count:1,module_name:"Liquid Tanks"}}

#$moduleUpdateList
