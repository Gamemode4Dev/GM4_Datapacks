scoreboard objectives add gm4_spawner_fuel dummy
scoreboard objectives add gm4_spawner_time dummy
scoreboard objectives add gm4_spawner_data dummy
scoreboard objectives add gm4_sm_flowers dummy
function gm4_spawner_minecarts:fuel/initiate_flower_types

execute unless score spawner_minecarts gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Spawner Minecarts"}
scoreboard players set spawner_minecarts gm4_modules 1

schedule function gm4_spawner_minecarts:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4034.469592678415 ~ {CustomName:'"gm4_spawner_minecarts_guide"',Tags:["gm4_guide"],data:{type:"module",id:"spawner_minecarts",page_count:2,line_count:1,module_name:"Spawner Minecarts"}}

#$moduleUpdateList
