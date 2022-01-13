scoreboard objectives add gm4_smelt_data dummy
scoreboard objectives add gm4_smelt_id dummy

execute unless score smelteries gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Smelteries"}
scoreboard players set smelteries gm4_modules 1

schedule function gm4_smelteries:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4012.609778925561 ~ {CustomName:'"gm4_smelteries_guide"',Tags:["gm4_guide"],data:{type:"module",id:"smelteries",page_count:4,line_count:1,module_name:"Smelteries"}}

#$moduleUpdateList
