scoreboard objectives add gm4_creep_health dummy

execute unless score better_fire gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Better Fire"}
scoreboard players set better_fire gm4_modules 1

schedule function gm4_better_fire:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 455.770248169734 ~ {CustomName:'"gm4_better_fire_guide"',Tags:["gm4_guide"],data:{type:"module",id:"better_fire",page_count:1,line_count:1,module_name:"Better Fire"}}

#$moduleUpdateList
