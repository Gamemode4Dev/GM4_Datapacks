# calculate the pitch the horse wing should have
# @s = item_display
# at unspecified
# run from tick

scoreboard players add @s gm4_horse.wing_timer 1
execute on vehicle on passengers if entity @s[type=player] run scoreboard players operation $movement_speed gm4_horse_data = @s gm4_horse.horse_one_cm
scoreboard players operation $movement_speed gm4_horse_data /= #10 gm4_horse_data
execute if score $movement_speed gm4_horse_data matches 11.. run scoreboard players set $movement_speed gm4_horse_data 10
scoreboard players operation @s gm4_horse.wing_timer += $movement_speed gm4_horse_data

scoreboard players operation $period_x2 gm4_horse_data = #wing_period gm4_horse_data
scoreboard players operation $period_x2 gm4_horse_data *= #2 gm4_horse_data

# play sound on every flap
execute if score @s[tag=gm4_horse.glider_wing.right] gm4_horse.wing_timer >= $period_x2 gm4_horse_data at @s run playsound minecraft:entity.phantom.flap neutral @a ~ ~ ~ 1 0.75
execute if score @s gm4_horse.wing_timer >= $period_x2 gm4_horse_data run scoreboard players operation @s gm4_horse.wing_timer -= $period_x2 gm4_horse_data

execute if score @s gm4_horse.wing_timer < #wing_period gm4_horse_data run scoreboard players operation $phase gm4_horse_data = @s gm4_horse.wing_timer
execute unless score @s gm4_horse.wing_timer < #wing_period gm4_horse_data run scoreboard players operation $phase gm4_horse_data = #wing_period gm4_horse_data
execute unless score @s gm4_horse.wing_timer < #wing_period gm4_horse_data run scoreboard players operation $phase gm4_horse_data *= #2 gm4_horse_data
execute unless score @s gm4_horse.wing_timer < #wing_period gm4_horse_data run scoreboard players remove $phase gm4_horse_data 1
execute unless score @s gm4_horse.wing_timer < #wing_period gm4_horse_data run scoreboard players operation $phase gm4_horse_data -= @s gm4_horse.wing_timer

scoreboard players operation $p_1 gm4_horse_data = $phase gm4_horse_data
scoreboard players operation $p_1 gm4_horse_data *= #2000 gm4_horse_data
scoreboard players operation $p_1 gm4_horse_data /= #wing_period gm4_horse_data
scoreboard players remove $p_1 gm4_horse_data 1000

scoreboard players operation $p_2 gm4_horse_data = $p_1 gm4_horse_data
scoreboard players operation $p_2 gm4_horse_data *= $p_2 gm4_horse_data
scoreboard players operation $p_2 gm4_horse_data /= #1000 gm4_horse_data

scoreboard players set $shaped gm4_horse_data 1000
scoreboard players operation $shaped gm4_horse_data -= $p_2 gm4_horse_data

scoreboard players operation $pitch gm4_horse_data = $shaped gm4_horse_data
scoreboard players operation $pitch gm4_horse_data *= #3000 gm4_horse_data
execute unless score @s gm4_horse.wing_timer < #wing_period gm4_horse_data run scoreboard players operation $pitch gm4_horse_data *= #-1 gm4_horse_data

return run scoreboard players operation $pitch gm4_horse_data /= #1000 gm4_horse_data
