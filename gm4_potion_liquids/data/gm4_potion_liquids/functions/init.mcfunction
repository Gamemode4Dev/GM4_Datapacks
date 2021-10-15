execute unless score potion_liquids gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Potion Liquids"}
scoreboard players set potion_liquids gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3414.390828457077 ~ {CustomName:'"gm4_potion_liquids_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"liquid_tanks",id:"potion_liquids",page_count:2,line_count:1,module_name:"Potion Liquids"}}

#$moduleUpdateList
