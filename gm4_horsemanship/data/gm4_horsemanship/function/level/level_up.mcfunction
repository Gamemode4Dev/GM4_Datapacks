# apply level-up to gm4_horse
# @s = gm4_horse
# at @s
# run from horse_processsing/general

execute if score @s gm4_horse.level matches 15.. run return 0

# | Max Health
execute store result score $health gm4_horse_data run attribute @s max_health modifier value get gm4_horse.health 10
scoreboard players add $health gm4_horse_data 20
execute store result storage gm4_horse:temp attribute.health float 0.1 run scoreboard players get $health gm4_horse_data

# | Movement Speed
execute store result score $speed gm4_horse_data run attribute @s movement_speed modifier value get gm4_horse.speed 100000
scoreboard players operation $speed gm4_horse_data += @s gm4_horse.speed_on_level
execute store result storage gm4_horse:temp attribute.speed float 0.00001 run scoreboard players get $speed gm4_horse_data

# | Jump Strength
execute store result score $jump gm4_horse_data run attribute @s jump_strength modifier value get gm4_horse.jump 100000
scoreboard players operation $jump gm4_horse_data += @s gm4_horse.jump_strength_on_level
execute store result storage gm4_horse:temp attribute.jump float 0.00001 run scoreboard players get $jump gm4_horse_data

# | Scores
scoreboard players add @s gm4_horse.level 1
scoreboard players operation @s gm4_horse.stamina_cap += #25 gm4_horse_data
scoreboard players operation @s gm4_horse.stamina += #25 gm4_horse_data
scoreboard players set @s gm4_horse.experience_to_level 0

# set new needed experience
execute if score @s gm4_horse.level matches 1 run scoreboard players set @s gm4_horse.experience_to_level 75
execute if score @s gm4_horse.level matches 2 run scoreboard players set @s gm4_horse.experience_to_level 100
execute if score @s gm4_horse.level matches 3 run scoreboard players set @s gm4_horse.experience_to_level 150
execute if score @s gm4_horse.level matches 4 run scoreboard players set @s gm4_horse.experience_to_level 225
execute if score @s gm4_horse.level matches 5 run scoreboard players set @s gm4_horse.experience_to_level 325
execute if score @s gm4_horse.level matches 6 run scoreboard players set @s gm4_horse.experience_to_level 450
execute if score @s gm4_horse.level matches 7 run scoreboard players set @s gm4_horse.experience_to_level 600
execute if score @s gm4_horse.level matches 8 run scoreboard players set @s gm4_horse.experience_to_level 825
execute if score @s gm4_horse.level matches 9 run scoreboard players set @s gm4_horse.experience_to_level 1125
execute if score @s gm4_horse.level matches 10 run scoreboard players set @s gm4_horse.experience_to_level 1500
execute if score @s gm4_horse.level matches 11 run scoreboard players set @s gm4_horse.experience_to_level 2100
execute if score @s gm4_horse.level matches 12 run scoreboard players set @s gm4_horse.experience_to_level 3000
execute if score @s gm4_horse.level matches 13 run scoreboard players set @s gm4_horse.experience_to_level 4500
execute if score @s gm4_horse.level matches 14 run scoreboard players set @s gm4_horse.experience_to_level 6750

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
