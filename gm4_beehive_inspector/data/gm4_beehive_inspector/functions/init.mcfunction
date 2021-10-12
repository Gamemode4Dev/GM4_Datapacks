scoreboard objectives add gm4_beehive_insp dummy

execute unless score beehive_inspector gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Beehive Inspector"}
scoreboard players set beehive_inspector gm4_modules 1

schedule function gm4_beehive_inspector:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 451.409887427704 ~ {CustomName:'"gm4_beehive_inspector_guide"',Tags:["gm4_guide"],data:{type:"module",id:"beehive_inspector",page_count:1,line_count:1,module_name:"Beehive Inspector"}}

#$moduleUpdateList
