scoreboard objectives add gm4_es_data dummy
scoreboard objectives add gm4_es_age dummy
scoreboard objectives add gm4_es_mine minecraft.mined:minecraft.stone

execute unless score everstone gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Everstone"}
scoreboard players set everstone gm4_modules 1

schedule function gm4_everstone:main 1t
schedule function gm4_everstone:tick 1t
schedule function gm4_everstone:aging 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1198.826895401271 ~ {CustomName:'"gm4_everstone_guide"',Tags:["gm4_guide"],data:{type:"module",id:"everstone",page_count:2,line_count:1,module_name:"Everstone"}}

#$moduleUpdateList
