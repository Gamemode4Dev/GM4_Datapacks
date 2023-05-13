scoreboard objectives add gm4_ps_time dummy
scoreboard players set modulo gm4_ps_time 3
scoreboard objectives add gm4_entity_version dummy

execute unless score phantom_scarecrows gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Phantom Scarecrows"}
scoreboard players set phantom_scarecrows gm4_modules 1

schedule function gm4_phantom_scarecrows:main 1t
schedule function gm4_phantom_scarecrows:tick 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3355.69973880393 ~ {CustomName:'"gm4_phantom_scarecrows_guide"',Tags:["gm4_guide"],data:{type:"module",id:"phantom_scarecrows",page_count:2,line_count:1,module_name:"Phantom Scarecrows"}}

#$moduleUpdateList
