scoreboard objectives add gm4_gold_sword minecraft.used:minecraft.golden_sword

execute unless score potion_swords gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Potion Swords"}
scoreboard players set potion_swords gm4_modules 1

schedule function gm4_potion_swords:tick 1t

# guidebook
execute if score gm4_guidebook load.status matches 1 run summon marker ~ 3414.390832451182 ~ {CustomName:'"gm4_potion_swords_guide"',Tags:["gm4_guide"],data:{type:"module",id:"potion_swords",page_count:3,line_count:1,module_name:"Potion Swords"}}

#$moduleUpdateList
