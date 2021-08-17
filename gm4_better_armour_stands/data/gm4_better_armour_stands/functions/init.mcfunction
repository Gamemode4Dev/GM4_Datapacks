scoreboard objectives add gm4_bas_data dummy
scoreboard objectives add gm4_bas_mode dummy
scoreboard objectives add gm4_bas_id dummy

scoreboard players set #rounding gm4_bas_data 1500

team add gm4_bas
team modify gm4_bas collisionRule never

execute unless score better_armour_stands gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Better Armour Stands"}
scoreboard players set better_armour_stands gm4_modules 1

schedule function gm4_better_armour_stands:main 1t
schedule function gm4_better_armour_stands:tick 1t

#$moduleUpdateList
