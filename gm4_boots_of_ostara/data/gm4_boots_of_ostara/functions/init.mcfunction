scoreboard objectives add gm4_boo_data dummy

execute unless score boots_of_ostara gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Boots Of Ostara"}
scoreboard players set boots_of_ostara gm4_modules 1

schedule function gm4_boots_of_ostara:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 530.619456296557 ~ {CustomName:'"gm4_boots_of_ostara_guide"',Tags:["gm4_guide"],data:{type:"module",id:"boots_of_ostara",page_count:3,line_count:1,module_name:"Boots of Ostara"}}

#$moduleUpdateList
