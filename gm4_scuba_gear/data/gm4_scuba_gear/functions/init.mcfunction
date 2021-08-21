scoreboard objectives add gm4_sg_swim minecraft.custom:minecraft.swim_one_cm

execute unless score scuba_gear gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Scuba Gear"}
scoreboard players set scuba_gear gm4_modules 1

schedule function gm4_scuba_gear:main 1t

# guidebook
summon marker ~ 3940.760733778647 ~ {CustomName:'"gm4_scuba_gear_guide"',Tags:["gm4_guide"],data:{type:"module",id:"scuba_gear",page_count:1,line_count:1,module_name:"SCUBA Gear"}}

#$moduleUpdateList
