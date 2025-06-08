# apply level-up to gm4_horse
# @s = gm4_horse
# at @s
# run from horse_processsing/general

# | Max Health
execute store result score $health gm4_horse_data run attribute @s max_health modifier value get gm4_horse.health 10
scoreboard players add $health gm4_horse_data 20
execute store result storage gm4_horse:temp attribute.health float 0.1 run scoreboard players get $health gm4_horse_data

# | Movement Speed
execute store result score $speed gm4_horse_data run attribute @s movement_speed modifier value get gm4_horse.speed 100000
scoreboard players operation $speed gm4_horse_data += @s gm4_horse_speed_step
execute store result storage gm4_horse:temp attribute.speed float 0.00001 run scoreboard players get $speed gm4_horse_data

# | Jump Strength
execute store result score $jump gm4_horse_data run attribute @s jump_strength modifier value get gm4_horse.jump 100000
scoreboard players operation $jump gm4_horse_data += @s gm4_horse_jump_step
execute store result storage gm4_horse:temp attribute.jump float 0.00001 run scoreboard players get $jump gm4_horse_data

# | Scores
scoreboard players add @s gm4_horse_level 1
scoreboard players operation @s gm4_horse_need.stamina_cap += $need_cap.stamina_step gm4_horse_data
scoreboard players operation @s gm4_horse_need.stamina += $need_cap.stamina_step gm4_horse_data
scoreboard players set @s gm4_horse_experience 0

# set new needed experience
execute if score @s gm4_horse_level matches 1 run scoreboard players set @s gm4_horse_experience 15
execute if score @s gm4_horse_level matches 2 run scoreboard players set @s gm4_horse_experience 20
execute if score @s gm4_horse_level matches 3 run scoreboard players set @s gm4_horse_experience 30
execute if score @s gm4_horse_level matches 4 run scoreboard players set @s gm4_horse_experience 45
execute if score @s gm4_horse_level matches 5 run scoreboard players set @s gm4_horse_experience 65
execute if score @s gm4_horse_level matches 6 run scoreboard players set @s gm4_horse_experience 90
execute if score @s gm4_horse_level matches 7 run scoreboard players set @s gm4_horse_experience 120
execute if score @s gm4_horse_level matches 8 run scoreboard players set @s gm4_horse_experience 165
execute if score @s gm4_horse_level matches 9 run scoreboard players set @s gm4_horse_experience 225
execute if score @s gm4_horse_level matches 10 run scoreboard players set @s gm4_horse_experience 300
execute if score @s gm4_horse_level matches 11 run scoreboard players set @s gm4_horse_experience 420
execute if score @s gm4_horse_level matches 12 run scoreboard players set @s gm4_horse_experience 600
execute if score @s gm4_horse_level matches 13 run scoreboard players set @s gm4_horse_experience 900
execute if score @s gm4_horse_level matches 14 run scoreboard players set @s gm4_horse_experience 1350

# modify attributes from storage
attribute @s max_health modifier remove gm4_horse.health
attribute @s movement_speed modifier remove gm4_horse.speed
attribute @s jump_strength modifier remove gm4_horse.jump
function gm4_horsemanship:level/level_up_eval with storage gm4_horse:temp attribute
data remove storage gm4_horse:temp attribute

# vfx
particle happy_villager ~ ~1 ~ 1 1 1 0 16
playsound entity.player.levelup neutral @a ~ ~1 ~ 0.7 1.6
effect give @s minecraft:regeneration 3 1
