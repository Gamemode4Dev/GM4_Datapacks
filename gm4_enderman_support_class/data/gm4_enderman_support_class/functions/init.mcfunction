execute unless score enderman_support_class gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Enderman Support Class"}
scoreboard players set enderman_support_class gm4_modules 1

schedule function gm4_enderman_support_class:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1137.403206101032 ~ {CustomName:'"gm4_enderman_support_class_guide"',Tags:["gm4_guide"],data:{type:"module",id:"enderman_support_class",page_count:2,line_count:2,module_name:"Enderman Support Class"}}

#$moduleUpdateList
