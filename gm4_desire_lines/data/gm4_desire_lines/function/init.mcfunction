scoreboard objectives add gm4_dl_random dummy
scoreboard objectives add gm4_desire_lines minecraft.custom:minecraft.walk_one_cm
scoreboard objectives add gm4_dl_sprint minecraft.custom:minecraft.sprint_one_cm
scoreboard objectives add gm4_dl_affcoarse dummy

execute unless score desire_lines gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Desire Lines"}
execute unless score desire_lines gm4_earliest_version < desire_lines gm4_modules run scoreboard players operation desire_lines gm4_earliest_version = desire_lines gm4_modules
scoreboard players set desire_lines gm4_modules 1

schedule function gm4_desire_lines:tick 1t


execute if score gm4_guidebook load.status matches 1 run summon marker ~ 659.208197558196 ~ {CustomName:'"gm4_celaro_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"celaro_shamir",page_count:2,line_count:1,module_name:"Celaro Shamir"}}

#$moduleUpdateList
