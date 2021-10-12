execute unless score pig_tractors gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Pig Tractors"}
scoreboard players set pig_tractors gm4_modules 1

scoreboard objectives add gm4_pig_tractors dummy

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3365.081694615826 ~ {CustomName:'"gm4_pig_tractors_guide"',Tags:["gm4_guide"],data:{type:"module",id:"pig_tractors",page_count:2,line_count:1,module_name:"Pig Tractors"}}

#$moduleUpdateList
