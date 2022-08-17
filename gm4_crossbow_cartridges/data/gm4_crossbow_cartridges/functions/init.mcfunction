scoreboard objectives add gm4_cb_string dummy
scoreboard objectives add gm4_cb_tw_hook dummy
scoreboard objectives add gm4_cb_tw_length dummy

execute unless score crossbow_cartridges gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Crossbow Cartridges"}
scoreboard players set crossbow_cartridges gm4_modules 1

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 759.376738885446 ~ {CustomName:'"gm4_crossbow_cartridges_guide"',Tags:["gm4_guide"],data:{type:"module",id:"crossbow_cartridges",page_count:2,line_count:2,module_name:"Crossbow Cartridges"}}

#$moduleUpdateList
