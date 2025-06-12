# init a new gm4_horse
# @s = new gm4_horse
# at @s
# run from tame_horse

tag @s add gm4_horse

# | Max Health & Scale
execute store result storage gm4_horse:temp attribute.health_remove_base float -0.01 run attribute @s max_health base get 100
# 0.8 - 1.2
execute store result score $scale gm4_horse_data run attribute @s scale base get 100
execute store result score $scale_add gm4_horse_data run attribute @s max_health base get 2.666666666
scoreboard players remove $scale gm4_horse_data 160
scoreboard players operation $scale gm4_horse_data += $scale_add gm4_horse_data
execute store result storage gm4_horse:temp attribute.scale float 0.01 run scoreboard players get $scale gm4_horse_data

# | Movement Speed
execute store result storage gm4_horse:temp attribute.speed_remove_base float -0.00001 run attribute @s movement_speed base get 100000
execute store result score $speed.start gm4_horse_data run attribute @s movement_speed base get 100000
scoreboard players operation @s gm4_horse_speed_step = $speed.start gm4_horse_data
scoreboard players operation @s gm4_horse_speed_step *= #1405 gm4_horse_data
scoreboard players operation @s gm4_horse_speed_step /= #1000 gm4_horse_data

scoreboard players add $speed.start gm4_horse_data 20000
scoreboard players operation $speed.start gm4_horse_data *= #1000 gm4_horse_data
scoreboard players operation $speed.start gm4_horse_data /= #4216 gm4_horse_data
execute store result storage gm4_horse:temp attribute.speed_start float 0.00001 run scoreboard players get $speed.start gm4_horse_data

scoreboard players operation @s gm4_horse_speed_step -= $speed.start gm4_horse_data
scoreboard players operation @s gm4_horse_speed_step /= #15 gm4_horse_data

# | Jump Strength (uses a lower scale to avoid going over the int limit)
execute store result storage gm4_horse:temp attribute.jump_remove_base float -0.00001 run attribute @s jump_strength base get 100000
execute store result score $jump.start gm4_horse_data run attribute @s jump_strength base get 10000
scoreboard players set @s gm4_horse_jump_step 21000
scoreboard players operation @s gm4_horse_jump_step -= $jump.start gm4_horse_data
scoreboard players operation @s gm4_horse_jump_step *= $jump.start gm4_horse_data
scoreboard players operation @s gm4_horse_jump_step /= #1000 gm4_horse_data

scoreboard players remove $jump.start gm4_horse_data 4000
scoreboard players operation $jump.start gm4_horse_data *= #10 gm4_horse_data
scoreboard players operation $jump.start gm4_horse_data /= #4 gm4_horse_data
scoreboard players add $jump.start gm4_horse_data 44500
execute store result storage gm4_horse:temp attribute.jump_start float 0.00001 run scoreboard players get $jump.start gm4_horse_data

scoreboard players operation @s gm4_horse_jump_step -= $jump.start gm4_horse_data
scoreboard players operation @s gm4_horse_jump_step /= #15 gm4_horse_data

# modify attributes from storage
function gm4_horsemanship:level/init_horse_eval with storage gm4_horse:temp attribute
data remove storage gm4_horse:temp attribute

effect give @s regeneration 4 9 true
