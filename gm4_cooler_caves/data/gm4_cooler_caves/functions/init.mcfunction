execute unless score cooler_caves gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Cooler Caves"}
scoreboard players set cooler_caves gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 736.421522857372 ~ {CustomName:'"gm4_cooler_caves_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"orbis",id:"cooler_caves",page_count:3,line_count:1,module_name:"Cooler Caves"}}

#$moduleUpdateList
