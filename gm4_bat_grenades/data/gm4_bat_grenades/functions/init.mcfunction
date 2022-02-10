execute unless score bat_grenades gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Bat Grenades"}
scoreboard players set bat_grenades gm4_modules 1

schedule function gm4_bat_grenades:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 425.13672765259 ~ {CustomName:'"gm4_bat_grenades_guide"',Tags:["gm4_guide"],data:{type:"module",id:"bat_grenades",page_count:1,line_count:1,module_name:"Bat Grenades"}}

#$moduleUpdateList
