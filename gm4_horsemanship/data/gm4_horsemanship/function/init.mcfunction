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

# constants
scoreboard players set #4 gm4_horse_data 4
scoreboard players set #10 gm4_horse_data 10
scoreboard players set #15 gm4_horse_data 15
scoreboard players set #25 gm4_horse_data 25
scoreboard players set #1000 gm4_horse_data 1000
scoreboard players set #1405 gm4_horse_data 1405
scoreboard players set #4216 gm4_horse_data 4216

schedule function gm4_horsemanship:main 1t

#$moduleUpdateList
