scoreboard objectives add gm4_rl_data dummy

execute unless score relocators gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Relocators"}
scoreboard players set relocators gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3747.715612412508 ~ {CustomName:'"gm4_relocators_guide"',Tags:["gm4_guide"],data:{type:"module",id:"relocators",page_count:3,line_count:1,module_name:"Relocators"}}

#$moduleUpdateList
