# mysterious midnights base
scoreboard objectives add gm4_mm_data dummy

# expansions
scoreboard objectives add gm4_tipped_type dummy
scoreboard objectives add gm4_rezombify dummy
scoreboard objectives add gm4_reskelify dummy
scoreboard objectives add gm4_fstar_decay dummy

execute unless score mysterious_midnights gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Mysterious Midnights"}
execute unless score mysterious_midnights gm4_earliest_version < mysterious_midnights gm4_modules run scoreboard players operation mysterious_midnights gm4_earliest_version = mysterious_midnights gm4_modules
scoreboard players set mysterious_midnights gm4_modules 1

schedule function gm4_mysterious_midnights:main 1t



#$moduleUpdateList
