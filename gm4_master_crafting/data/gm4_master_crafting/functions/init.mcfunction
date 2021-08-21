execute unless score master_crafting gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Master Crafting"}
scoreboard players set master_crafting gm4_modules 1

# guidebook
summon marker ~ 2689.787880304922 ~ {CustomName:'"gm4_master_crafting_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"custom_crafters",id:"master_crafting",page_count:1,line_count:1,module_name:"Master Crafting"}}

#$moduleUpdateList
