scoreboard objectives add gm4_count dummy

execute unless score trapped_signs gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Trapped Signs"}
scoreboard players set trapped_signs gm4_modules 1

schedule function gm4_trapped_signs:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4255.539464789339 ~ {CustomName:'"gm4_trapped_signs_guide"',Tags:["gm4_guide"],data:{type:"module",id:"trapped_signs",page_count:3,line_count:1,module_name:"Trapped Signs"}}

#$moduleUpdateList
