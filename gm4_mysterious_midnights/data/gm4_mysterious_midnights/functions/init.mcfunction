# mysterious midnights base
scoreboard objectives add gm4_mm_data dummy

# expansions
scoreboard objectives add gm4_tipped_type dummy
scoreboard objectives add gm4_rezombify dummy
scoreboard objectives add gm4_reskelify dummy

execute unless score mysterious_midnights gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Mysterious Midnights"}
scoreboard players set mysterious_midnights gm4_modules 1

schedule function gm4_mysterious_midnights:main 1t

#$moduleUpdateList
