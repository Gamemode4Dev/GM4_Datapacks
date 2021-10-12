scoreboard objectives add gm4_shroom_time dummy
scoreboard objectives add gm4_sporeprint dummy

execute unless score shroomites gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Shroomites"}
scoreboard players set shroomites gm4_modules 1

schedule function gm4_shroomites:main 1t
schedule function gm4_shroomites:tick 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3978.182929656843 ~ {CustomName:'"gm4_shroomites_guide"',Tags:["gm4_guide"],data:{type:"module",id:"shroomites",page_count:1,line_count:1,module_name:"Shroomites"}}

#$moduleUpdateList
