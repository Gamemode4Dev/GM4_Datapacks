execute unless score standard_crafting gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Standard Crafting"}
scoreboard players set standard_crafting gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4064.873907657601 ~ {CustomName:'"gm4_standard_crafting_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"custom_crafters",id:"standard_crafting",page_count:6,line_count:1,module_name:"Standard Crafting"}}

#$moduleUpdateList
