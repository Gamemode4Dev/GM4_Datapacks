execute unless score washing_tanks gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Washing Tanks"}
scoreboard players set washing_tanks gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4748.575171464641 ~ {CustomName:'"gm4_washing_tanks_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"liquid_tanks",id:"washing_tanks",page_count:1,line_count:1,module_name:"Washing Tanks"}}

#$moduleUpdateList
