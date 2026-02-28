# init a new gm4_horse
# @s = new gm4_horse
# at @s
# run from main

tag @s add gm4_horse

# | Max Health & Scale
execute store result storage gm4_horsemanship:temp attribute.health_base float 0.01 run attribute @s max_health base get 100
# 0.8 - 1.2
execute store result score $scale gm4_horse_data run attribute @s scale base get 100
execute store result score $scale_add gm4_horse_data run attribute @s max_health base get 2.666666666
scoreboard players remove $scale gm4_horse_data 160
scoreboard players operation $scale gm4_horse_data += $scale_add gm4_horse_data
execute store result storage gm4_horsemanship:temp attribute.scale float 0.01 run scoreboard players get $scale gm4_horse_data

# | Movement Speed
# Formula: 0.85*x + level*((0.555*x)/15)
execute store result storage gm4_horsemanship:temp attribute.speed_base float 0.00001 run attribute @s movement_speed base get 100000
execute store result score $speed.start gm4_horse_data run attribute @s movement_speed base get 100000
scoreboard players operation @s gm4_horse.speed_on_level = $speed.start gm4_horse_data
scoreboard players operation @s gm4_horse.speed_on_level *= #555 gm4_horse_data
scoreboard players operation @s gm4_horse.speed_on_level /= #15000 gm4_horse_data

scoreboard players operation $speed.start gm4_horse_data *= #85 gm4_horse_data
execute store result storage gm4_horsemanship:temp attribute.speed_start float 0.0000001 run scoreboard players get $speed.start gm4_horse_data

# | Jump Strength
# Formula: x + level*(-x/45 + 0.02888)
execute store result storage gm4_horsemanship:temp attribute.jump_base float 0.00001 run attribute @s jump_strength base get 100000
execute store result score @s gm4_horse.jump_strength_on_level run attribute @s jump_strength base get -100000
scoreboard players operation @s gm4_horse.jump_strength_on_level /= #45 gm4_horse_data
scoreboard players add @s gm4_horse.jump_strength_on_level 2888

execute store result storage gm4_horsemanship:temp attribute.jump_start float 0.00001 run attribute @s jump_strength base get 100000

# modify attributes from storage
function gm4_horsemanship:level/init_horse_eval with storage gm4_horsemanship:temp attribute
data remove storage gm4_horsemanship:temp attribute

effect give @s regeneration 4 9 true
