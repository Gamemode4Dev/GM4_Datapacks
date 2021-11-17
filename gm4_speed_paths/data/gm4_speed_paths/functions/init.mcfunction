execute unless score speed_paths gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Speed Paths"}
scoreboard players set speed_paths gm4_modules 1

scoreboard objectives add gm4_speed_paths dummy

schedule function gm4_speed_paths:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4035.407299202457 ~ {CustomName:'"gm4_speed_paths_guide"',Tags:["gm4_guide"],data:{type:"module",id:"speed_paths",page_count:1,line_count:1,module_name:"Speed Paths"}}

#$moduleUpdateList
