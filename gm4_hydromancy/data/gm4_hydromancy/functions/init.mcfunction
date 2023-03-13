execute unless score hydromancy gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Hydromancy"}
scoreboard players set hydromancy gm4_modules 1

scoreboard objectives add gm4_hy_data dummy
scoreboard players set #3 gm4_hy_data 3
scoreboard players set #6 gm4_hy_data 6
scoreboard players set #10 gm4_hy_data 10
scoreboard players set #15 gm4_hy_data 15
scoreboard players set #65536 gm4_hy_data 65536
scoreboard players set #16842752 gm4_hy_data 16842752

scoreboard objectives add gm4_hy_goal dummy
scoreboard objectives add gm4_hy_charge dummy
scoreboard objectives add gm4_hy_next_charge_change dummy

schedule function gm4_hydromancy:main 1t
schedule function gm4_hydromancy:slow_clock 1t

#$moduleUpdateList
