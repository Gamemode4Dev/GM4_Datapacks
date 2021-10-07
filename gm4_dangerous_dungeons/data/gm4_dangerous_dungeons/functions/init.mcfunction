execute unless score dangerous_dungeons gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Dangerous Dungeons"}
scoreboard players set dangerous_dungeons gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1.. run summon marker ~ 835.219565628447 ~ {CustomName:'"gm4_dangerous_dungeons_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"orbis",id:"dangerous_dungeons",page_count:1,line_count:2,module_name:"Dangerous Dungeons"}}

#$moduleUpdateList
