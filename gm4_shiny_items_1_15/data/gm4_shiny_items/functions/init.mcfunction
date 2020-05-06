scoreboard objectives add gm4_absorbed_xp dummy
scoreboard objectives add gm4_xporb_xp dummy

execute unless score shiny_items gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"shiny items"}
scoreboard players set shiny_items gm4_modules 1

schedule function gm4_shiny_items:main 10t
schedule function gm4_shiny_items:tick 10t

#$moduleUpdateList


