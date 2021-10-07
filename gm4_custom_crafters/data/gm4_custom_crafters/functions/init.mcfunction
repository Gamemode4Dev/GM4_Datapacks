scoreboard objectives add gm4_slot_count dummy
scoreboard objectives add gm4_stack_size dummy

#declare storage gm4_custom_crafters:temp/crafter

execute unless score custom_crafters gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Custom Crafters"}
scoreboard players set custom_crafters gm4_modules 1

schedule function gm4_custom_crafters:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1.. run summon marker ~ 783.392311518527 ~ {CustomName:'"gm4_custom_crafters_guide"',Tags:["gm4_guide"],data:{type:"base",expansions:[],id:"custom_crafters",page_count:1,line_count:1,module_name:"Custom Crafters"}}

#$moduleUpdateList
