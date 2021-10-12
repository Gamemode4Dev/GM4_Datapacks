execute unless score vertical_rails gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Vertical Rails"}
scoreboard players set vertical_rails gm4_modules 1

schedule function gm4_vertical_rails:main 1t
schedule function gm4_vertical_rails:tick 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 4573.029362839848 ~ {CustomName:'"gm4_vertical_rails_guide"',Tags:["gm4_guide"],data:{type:"module",id:"vertical_rails",page_count:2,line_count:1,module_name:"Vertical Rails"}}

#$moduleUpdateList
