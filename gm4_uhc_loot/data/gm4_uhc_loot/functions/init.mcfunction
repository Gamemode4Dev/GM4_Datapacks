execute unless score uhc_loot gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"UHC Loot"}
scoreboard players set uhc_loot gm4_modules 1

schedule function gm4_uhc_loot:main 10t

#$moduleUpdateList
