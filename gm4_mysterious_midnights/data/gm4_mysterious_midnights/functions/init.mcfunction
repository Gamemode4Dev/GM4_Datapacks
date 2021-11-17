# mysterious midnights base
scoreboard objectives add gm4_mm_data dummy

# expansions
scoreboard objectives add gm4_tipped_type dummy
scoreboard objectives add gm4_rezombify dummy
scoreboard objectives add gm4_reskelify dummy
scoreboard objectives add gm4_fstar_decay dummy

execute unless score mysterious_midnights gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Mysterious Midnights"}
scoreboard players set mysterious_midnights gm4_modules 1

schedule function gm4_mysterious_midnights:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4191.141262308746 ~ {CustomName:'"gm4_tipped_skeletons_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"mysterious_midnights",id:"tipped_skeletons",page_count:1,line_count:1,module_name:"Tipped Skeletons"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3749.761428319238 ~ {CustomName:'"gm4_resurrecting_zombies_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"mysterious_midnights",id:"resurrecting_zombies",page_count:1,line_count:2,module_name:"Resurrecting Zombies"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3749.761428319238 ~ {CustomName:'"gm4_resurrecting_skeletons_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"mysterious_midnights",id:"resurrecting_skeletons",page_count:1,line_count:2,module_name:"Resurrecting Skeletons"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 2953.174852106298 ~ {CustomName:'"gm4_nightmare_nights_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"mysterious_midnights",id:"nightmare_nights",page_count:2,line_count:1,module_name:"Nightmare Nights"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 2872.802223089131 ~ {CustomName:'"gm4_mysterious_midnights_guide"',Tags:["gm4_guide"],data:{type:"base",expansions:[],id:"mysterious_midnights",page_count:1,line_count:1,module_name:"Mysterious Midnights"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1660.070734297034 ~ {CustomName:'"gm4_harvest_moons_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"mysterious_midnights",id:"harvest_moons",page_count:1,line_count:1,module_name:"Harvest Moons"}}
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1246.490760506877 ~ {CustomName:'"gm4_falling_stars_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"mysterious_midnights",id:"falling_stars",page_count:1,line_count:1,module_name:"Falling Stars"}}

#$moduleUpdateList
