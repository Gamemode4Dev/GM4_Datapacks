execute unless score tower_structures gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Tower Structures"}
scoreboard players set tower_structures gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1.. run summon marker ~ 4238.762042469422 ~ {CustomName:'"gm4_tower_structures_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"orbis",id:"tower_structures",page_count:1,line_count:1,module_name:"Tower Structures"}}

#$moduleUpdateList
