# objectives
scoreboard objectives add gm4_shroom_data dummy
scoreboard objectives add gm4_entity_version dummy

# fixed values
scoreboard players set #spore_max_age gm4_shroom_data 12
scoreboard players set #spore_placement_cooldown gm4_shroom_data 8
scoreboard players set #shroom_placement_cooldown gm4_shroom_data 64
scoreboard players set #fertilization_cost gm4_shroom_data 2
scoreboard players set #conversion_cost gm4_shroom_data 16
scoreboard players set #global_spore_cap gm4_shroom_data 2048
scoreboard players set #global_shroom_cap gm4_shroom_data 1024

execute unless score shroomites gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Shroomites"}
scoreboard players set shroomites gm4_modules 1

schedule function gm4_shroomites:main 1t
schedule function gm4_shroomites:slow_clock 32t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3978.182929656843 ~ {CustomName:'"gm4_shroomites_guide"',Tags:["gm4_guide"],data:{type:"module",id:"shroomites",page_count:1,line_count:1,module_name:"Shroomites"}}

#$moduleUpdateList
