# process horse being fed food
# @s = gm4_horse
# at @s
# run from need/food/feed_added_food
# run from need/food/feed_added_food_untamed

scoreboard players set $food_processed gm4_horse_data 1
tag @s remove gm4_horse_target

execute store result score $health gm4_horse_data run data get entity @s Health 100
execute store result score $age gm4_horse_data run data get entity @s Age

scoreboard players add $health gm4_horse_data 100
scoreboard players set $add_age gm4_horse_data 400


execute store result entity @s Health float 0.01 run scoreboard players get $health gm4_horse_data
function gm4_horsemanship:horse_processing/cap_health
execute if score $age gm4_horse_data matches ..-1 run function gm4_horsemanship:need/food/add_age


execute unless entity @s[tag=gm4_horse.tamed] run return 0
scoreboard players remove @s gm4_horse.stamina 10
scoreboard players operation @s gm4_horse.stamina > #0 gm4_horse_data
