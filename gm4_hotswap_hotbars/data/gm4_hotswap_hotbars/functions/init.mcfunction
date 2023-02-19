scoreboard objectives add gm4_hh_data dummy

execute unless score hotswap_hotbars gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Hotswap Hotbars"}
scoreboard players set hotswap_hotbars gm4_modules 1

schedule function gm4_hotswap_hotbars:main 6t

#$moduleUpdateList
