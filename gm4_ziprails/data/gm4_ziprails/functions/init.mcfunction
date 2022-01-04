execute unless score ziprails gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Ziprails"}
scoreboard players set ziprails gm4_modules 1

schedule function gm4_ziprails:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 5426.507494079028 ~ {CustomName:'"gm4_ziprails_guide"',Tags:["gm4_guide"],data:{type:"module",id:"ziprails",page_count:1,line_count:1,module_name:"Ziprails"}}

#$moduleUpdateList
