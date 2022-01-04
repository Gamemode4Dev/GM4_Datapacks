execute unless score chest_boats gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Chest Boats"}
scoreboard players set chest_boats gm4_modules 1

schedule function gm4_chest_boats:main 10t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 680.29685567109 ~ {CustomName:'"gm4_chest_boats_guide"',Tags:["gm4_guide"],data:{type:"module",id:"chest_boats",page_count:1,line_count:1,module_name:"Chest Boats"}}

#$moduleUpdateList
