scoreboard objectives add gm4_reslimify dummy
scoreboard objectives add gm4_menace_data dummy
scoreboard players set 100 gm4_menace_data 100
scoreboard players set 17 gm4_menace_data 17
scoreboard players set 21 gm4_menace_data 21
scoreboard players set 2 gm4_menace_data 2
scoreboard objectives add gm4_entity_version dummy
team add gm4_hide_name
team modify gm4_hide_name nametagVisibility never

execute unless score midnight_menaces gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Midnight Menaces"}
scoreboard players set midnight_menaces gm4_modules 1

schedule function gm4_menacing_goblins:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4006.118556280305 ~ {CustomName:'"gm4_slime_fests_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"mysterious_midnights",id:"slime_fests",page_count:2,line_count:1,module_name:"Slime Fests"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3923.562774053115 ~ {CustomName:'"gm4_sandy_husks_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"mysterious_midnights",id:"sandy_husks",page_count:1,line_count:1,module_name:"Sandy Husks"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 2718.678477504404 ~ {CustomName:'"gm4_menacing_goblins_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"mysterious_midnights",id:"menacing_goblins",page_count:2,line_count:1,module_name:"Menacing Goblins"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1948.143678907496 ~ {CustomName:'"gm4_illusioner_nights_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"mysterious_midnights",id:"illusioner_nights",page_count:1,line_count:1,module_name:"Illusioner Nights"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1883.164474157157 ~ {CustomName:'"gm4_icy_strays_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"mysterious_midnights",id:"icy_strays",page_count:1,line_count:1,module_name:"Icy Strays"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1139.620719129263 ~ {CustomName:'"gm4_enlarging_phantoms_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"mysterious_midnights",id:"enlarging_phantoms",page_count:1,line_count:1,module_name:"Enlarging Phantoms"}}

#$moduleUpdateList
