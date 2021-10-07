execute unless score ender_hoppers gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Ender Hoppers"}
scoreboard players set ender_hoppers gm4_modules 1

schedule function gm4_ender_hoppers:main 1t
schedule function gm4_ender_hoppers:tick 1t

# guidebook
summon marker ~ 1137.40314183342 ~ {CustomName:'"gm4_ender_hoppers_guide"',Tags:["gm4_guide"],data:{type:"module",id:"ender_hoppers",page_count:1,line_count:1,module_name:"Ender Hoppers"}}

#$moduleUpdateList
