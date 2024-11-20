scoreboard objectives add gm4_bas_id dummy
scoreboard objectives add gm4_bas_data dummy
scoreboard objectives add gm4_bas_mode dummy
scoreboard objectives add gm4_bas_turn dummy
scoreboard objectives add gm4_bas_dist dummy
scoreboard objectives add gm4_bas_dx dummy
scoreboard objectives add gm4_bas_dy dummy
scoreboard objectives add gm4_bas_dz dummy

scoreboard players set #1500 gm4_bas_data 1500

team add gm4_bas
team modify gm4_bas collisionRule never

data modify storage gm4_better_armour_stands:default Pose set value {Head:[0.01f, 0.0f, 0.0f],Body:[0.01f, 0.0f, 0.0f],LeftArm:[-10.01f, 0.0f, -10.0f],RightArm:[-15.01f, 0.0f, 10.0f],LeftLeg:[-1.01f, 0.0f, -1.0f],RightLeg:[1.01f, 0.0f, 1.0f]}

execute unless score better_armour_stands gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Better Armour Stands"}
execute unless score better_armour_stands gm4_earliest_version < better_armour_stands gm4_modules run scoreboard players operation better_armour_stands gm4_earliest_version = better_armour_stands gm4_modules
scoreboard players set better_armour_stands gm4_modules 1

schedule function gm4_better_armour_stands:main 1t
schedule function gm4_better_armour_stands:tick 1t



#$moduleUpdateList
