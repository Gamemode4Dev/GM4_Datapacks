scoreboard objectives add gm4_beehive_insp minecraft.mined:minecraft.beehive

execute unless score beehive_inspector gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Beehive Inspector"}
scoreboard players set beehive_inspector gm4_modules 1

schedule function gm4_beehive_inspector:main 1t

#$moduleUpdateList
