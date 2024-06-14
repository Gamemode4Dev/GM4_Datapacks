scoreboard objectives add gm4_armor armor
scoreboard objectives add gm4_armor_weight dummy

execute unless score weighted_armour gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Weighted Armour"}
execute unless score weighted_armour gm4_earliest_version < weighted_armour gm4_modules run scoreboard players operation weighted_armour gm4_earliest_version = weighted_armour gm4_modules
scoreboard players set weighted_armour gm4_modules 1

schedule function gm4_weighted_armour:main 1t


execute if score gm4_guidebook load.status matches 1 run summon marker ~ 1688.746464910336 ~ {CustomName:'"gm4_helious_shamir_guide"',Tags:["gm4_guide"],data:{type:"_expansion",base:"metallurgy",id:"helious_shamir",page_count:2,line_count:1,module_name:"Helious Shamir"}}

#$moduleUpdateList
