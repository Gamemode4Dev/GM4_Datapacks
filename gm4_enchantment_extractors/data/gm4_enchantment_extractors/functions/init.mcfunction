scoreboard objectives add gm4_ench_data dummy
team add gm4_hide_name
team modify gm4_hide_name nametagVisibility never

execute unless score enchantment_extractors gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Enchantment Extractors"}
scoreboard players set enchantment_extractors gm4_modules 1

schedule function gm4_enchantment_extractors:main 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1137.145595892059 ~ {CustomName:'"gm4_enchantment_extractors_guide"',Tags:["gm4_guide"],data:{type:"module",id:"enchantment_extractors",page_count:4,line_count:2,module_name:"Enchantment Extractors"}}

#$moduleUpdateList
