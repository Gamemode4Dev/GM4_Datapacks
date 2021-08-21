execute unless score better_armour_stands gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Better Armour Stands"}
scoreboard players set better_armour_stands gm4_modules 1

schedule function gm4_better_armour_stands:main 1t
schedule function gm4_better_armour_stands:tick 1t

# guidebook
summon marker ~ 455.770245686322 ~ {CustomName:'"gm4_better_armour_stands_guide"',Tags:["gm4_guide"],data:{type:"base",expansions:[],id:"better_armour_stands",page_count:1,line_count:2,module_name:"Better Armour Stands"}}

#$moduleUpdateList
