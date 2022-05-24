scoreboard objectives add gm4_crafting dummy

execute unless score forming_press gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Forming Press"}
scoreboard players set forming_press gm4_modules 1

schedule function gm4_forming_press:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 2689.787880304922 ~ {CustomName:'"gm4_forming_press_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"custom_crafters",id:"forming_press",page_count:7,line_count:1,module_name:"Forming Press"}}

#$moduleUpdateList
