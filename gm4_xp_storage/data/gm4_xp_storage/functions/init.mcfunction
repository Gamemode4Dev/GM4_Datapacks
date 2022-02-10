scoreboard objectives add gm4_stored_xp dummy
scoreboard objectives add gm4_xp_calc dummy

execute unless score xp_storage gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"XP Storage"}
scoreboard players set xp_storage gm4_modules 1

schedule function gm4_xp_storage:main 1t
schedule function gm4_xp_storage:tick 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 5068.978168549095 ~ {CustomName:'"gm4_xp_storage_guide"',Tags:["gm4_guide"],data:{type:"module",id:"xp_storage",page_count:2,line_count:1,module_name:"XP Storage"}}

#$moduleUpdateList
