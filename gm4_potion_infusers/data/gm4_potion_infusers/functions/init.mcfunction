execute unless score potion_infusers gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Potion Infusers"}
scoreboard players set potion_infusers gm4_modules 1

schedule function gm4_potion_infusers:main 1t

#$moduleUpdateList
