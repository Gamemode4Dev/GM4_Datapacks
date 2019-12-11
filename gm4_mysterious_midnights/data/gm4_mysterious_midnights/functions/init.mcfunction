scoreboard objectives add gm4_nights_data dummy
scoreboard players set 8 gm4_nights_data 8
scoreboard players set 16 gm4_nights_data 16
scoreboard players set 17 gm4_nights_data 17
scoreboard players set moon_phase gm4_nights_data -1
scoreboard players set send_night_end_pulse gm4_nights_data 0

scoreboard objectives add gm4_tipped_type dummy

scoreboard objectives add gm4_rezombify dummy
scoreboard objectives add gm4_reskelify dummy

execute unless score mysterious_midnights gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Mysterious Midnights"}
scoreboard players set mysterious_midnights gm4_modules 1

schedule function mysterious_midnights:main 1t

#$moduleUpdateList
