execute unless score horsemanship gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Horsemanship"}
scoreboard players set horsemanship gm4_modules 1

# add scoreboards
scoreboard objectives add gm4_horse_data dummy
scoreboard objectives add gm4_horse.level dummy
scoreboard objectives add gm4_horse.speed_on_level dummy
scoreboard objectives add gm4_horse.jump_strength_on_level dummy
scoreboard objectives add gm4_horse.experience_to_level dummy
scoreboard objectives add gm4_horse.stamina dummy
scoreboard objectives add gm4_horse.stamina_cap dummy
scoreboard objectives add gm4_horse.swim_power dummy
scoreboard objectives add gm4_horse.wing_timer dummy
scoreboard objectives add gm4_horse.horse_one_cm custom:horse_one_cm

# constants
scoreboard players set #-1 gm4_horse_data -1
scoreboard players set #2 gm4_horse_data 2
scoreboard players set #4 gm4_horse_data 4
scoreboard players set #10 gm4_horse_data 10
scoreboard players set #15 gm4_horse_data 15
scoreboard players set #25 gm4_horse_data 25
scoreboard players set #1000 gm4_horse_data 1000
scoreboard players set #1405 gm4_horse_data 1405
scoreboard players set #2000 gm4_horse_data 2000
scoreboard players set #3000 gm4_horse_data 3000
scoreboard players set #4216 gm4_horse_data 4216

scoreboard players set #wing_period gm4_horse_data 30

schedule function gm4_horsemanship:tick 1t
schedule function gm4_horsemanship:main 1t

#$moduleUpdateList
