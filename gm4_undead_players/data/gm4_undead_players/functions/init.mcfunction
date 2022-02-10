# Add death tracking scoreboard and reset in case player died while module was disabled.
scoreboard objectives add gm4_undead minecraft.custom:minecraft.deaths
scoreboard players reset * gm4_undead

# Add scoreboard used to implement custom logic for undead player drowned conversion.
scoreboard objectives add gm4_undead_drown dummy

execute unless score undead_players gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Undead Players"}
scoreboard players set undead_players gm4_modules 1

schedule function gm4_undead_players:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4431.654612246164 ~ {CustomName:'"gm4_undead_players_guide"',Tags:["gm4_guide"],data:{type:"module",id:"undead_players",page_count:1,line_count:1,module_name:"Undead Players"}}

#$moduleUpdateList
