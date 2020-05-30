scoreboard objectives add gm4_absorbed_xp dummy
scoreboard objectives add gm4_xporb_xp dummy
scoreboard objectives add gm4_shiny_ctrl dummy

scoreboard players set #xp_required gm4_shiny_ctrl 75

execute unless score shiny_items gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Shiny Items"}
scoreboard players set shiny_items gm4_modules 1

schedule function gm4_shiny_items:main 10t

#$moduleUpdateList
