execute unless score lightning_rods gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Lightning Rods"}
scoreboard players set lightning_rods gm4_modules 1

schedule function gm4_lightning_rods:main 1t

# guidebook
summon marker ~ 2541.392606440275 ~ {CustomName:'"gm4_lightning_rods_guide"',Tags:["gm4_guide"],data:{type:"module",id:"lightning_rods",page_count:1,line_count:1,module_name:"Lightning Rods"}}

#$moduleUpdateList
