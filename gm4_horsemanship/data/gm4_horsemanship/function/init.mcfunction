execute unless score horsemanship gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Horsemanship"}
scoreboard players set horsemanship gm4_modules 1

# add scoreboards
scoreboard objectives add gm4_horse_data dummy

scoreboard objectives add gm4_horse_level dummy
scoreboard objectives add gm4_horse_riding minecraft.custom:minecraft.horse_one_cm
scoreboard objectives add gm4_horse_speed_step dummy
scoreboard objectives add gm4_horse_jump_step dummy
scoreboard objectives add gm4_horse_experience dummy
scoreboard objectives add gm4_horse_comfort dummy

scoreboard objectives add gm4_horse_need.stamina dummy
scoreboard objectives add gm4_horse_need.on_leash dummy
scoreboard objectives add gm4_horse_need.fed_treat dummy
scoreboard objectives add gm4_horse_need.brushing dummy
scoreboard objectives add gm4_horse_need.graze dummy

scoreboard objectives add gm4_horse_potential.total dummy
scoreboard objectives add gm4_horse_potential.realized dummy

scoreboard objectives add gm4_horse.stamina_cap dummy
scoreboard objectives add gm4_horse.swim_power dummy

# constants
scoreboard players set #0 gm4_horse_data 0
scoreboard players set #4 gm4_horse_data 4
scoreboard players set #10 gm4_horse_data 10
scoreboard players set #15 gm4_horse_data 15
scoreboard players set #50 gm4_horse_data 50
scoreboard players set #100 gm4_horse_data 100
scoreboard players set #1000 gm4_horse_data 1000
scoreboard players set #1405 gm4_horse_data 1405
scoreboard players set #4216 gm4_horse_data 4216
scoreboard players set #100000 gm4_horse_data 100000

# Horse need caps
scoreboard players set $need_cap.graze gm4_horse_data 2160
scoreboard players set $need_cap.brushing gm4_horse_data 1500
scoreboard players set $need_cap.on_leash gm4_horse_data 1125
scoreboard players set $need_cap.stamina_start gm4_horse_data 75
scoreboard players set $need_cap.stamina_step gm4_horse_data 25
scoreboard players set $need_cap.fed_treat gm4_horse_data 15

schedule function gm4_horsemanship:tick 1t
schedule function gm4_horsemanship:main 1t

#$moduleUpdateList
