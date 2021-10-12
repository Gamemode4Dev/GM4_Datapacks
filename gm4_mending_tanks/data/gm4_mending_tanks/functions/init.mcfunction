scoreboard objectives add gm4_lt_util dummy
scoreboard players set #mt_repair_per_xp gm4_lt_util 2
scoreboard players set #mt_max_repair gm4_lt_util 32

execute unless score mending_tanks gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Mending Tanks"}
scoreboard players set mending_tanks gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 2718.712251362882 ~ {CustomName:'"gm4_mending_tanks_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"liquid_tanks",id:"mending_tanks",page_count:1,line_count:1,module_name:"Mending Tanks"}}

#$moduleUpdateList
