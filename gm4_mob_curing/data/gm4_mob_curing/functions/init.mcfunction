scoreboard objectives add gm4_mob_curing_data dummy
team add gm4_hide_name
team modify gm4_hide_name nametagVisibility never

execute unless score mob_curing gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Mob Curing"}
scoreboard players set mob_curing gm4_modules 1

schedule function gm4_mob_curing:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 2791.573318812042 ~ {CustomName:'"gm4_mob_curing_guide"',Tags:["gm4_guide"],data:{type:"module",id:"mob_curing",page_count:4,line_count:1,module_name:"Mob Curing"}}

#$moduleUpdateList
