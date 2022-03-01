execute unless score cement_mixers gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Cement Mixers"}
scoreboard players set cement_mixers gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 659.530987417665 ~ {CustomName:'"gm4_cement_mixers_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"liquid_tanks",id:"cement_mixers",page_count:1,line_count:1,module_name:"Cement Mixers"}}

#$moduleUpdateList
