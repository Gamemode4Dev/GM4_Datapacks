execute unless score record_crafting gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Record Crafting"}
scoreboard players set record_crafting gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3745.179591950063 ~ {CustomName:'"gm4_record_crafting_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"custom_crafters",id:"record_crafting",page_count:2,line_count:1,module_name:"Record Crafting"}}

#$moduleUpdateList
