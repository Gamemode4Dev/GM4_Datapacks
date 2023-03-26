scoreboard objectives add gm4_crafting dummy
scoreboard objectives add gm4_count dummy

schedule function gm4_custom_crafters:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 unless entity @e[type=marker,tag=gm4_guide,name='"gm4_custom_crafters_guide"',limit=1] run summon marker ~ 783.392311518527 ~ {CustomName:'"gm4_custom_crafters_guide"',Tags:["gm4_guide"],data:{type:"base",expansions:[],id:"custom_crafters",page_count:3,line_count:1,module_name:"Custom Crafters"}}
