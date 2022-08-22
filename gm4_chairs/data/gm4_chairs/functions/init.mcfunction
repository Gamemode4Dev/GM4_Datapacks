team add gm4_chairs
team modify gm4_chairs collisionRule never
scoreboard objectives add gm4_chairs_sit dummy
scoreboard objectives add gm4_entity_version dummy

execute unless score chairs gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Chairs"}
scoreboard players set chairs gm4_modules 1

schedule function gm4_chairs:main 1t
schedule function gm4_chairs:sit/check 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 679.061995077186 ~ {CustomName:'"gm4_chairs_guide"',Tags:["gm4_guide"],data:{type:"module",id:"chairs",page_count:1,line_count:1,module_name:"Chairs"}}

#$moduleUpdateList
