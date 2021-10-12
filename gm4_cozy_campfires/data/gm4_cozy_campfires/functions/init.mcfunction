scoreboard objectives add gm4_count dummy

execute unless score cozy_campfires gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Cozy Campfires"}
scoreboard players set cozy_campfires gm4_modules 1

schedule function gm4_cozy_campfires:main 10t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 739.663219176003 ~ {CustomName:'"gm4_cozy_campfires_guide"',Tags:["gm4_guide"],data:{type:"module",id:"cozy_campfires",page_count:1,line_count:1,module_name:"Cozy Campfires"}}

#$moduleUpdateList
