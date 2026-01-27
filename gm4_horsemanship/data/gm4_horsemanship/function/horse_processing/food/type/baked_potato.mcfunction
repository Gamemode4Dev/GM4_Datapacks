# process horse being fed food
# @s = gm4_horse
# at unspecified
# run from horse_processing/food/feed_added_food
# run from horse_processing/food/feed_added_food_untamed

scoreboard players set $food_processed gm4_horse_data 1
tag @s remove gm4_horse_target

execute store result score $health gm4_horse_data run data get entity @s Health 100
execute store result score $age gm4_horse_data run data get entity @s Age
execute store result score $temper gm4_horse_data run data get entity @s Temper

scoreboard players add $health gm4_horse_data 400
scoreboard players set $add_age gm4_horse_data 1200
scoreboard players add $temper gm4_horse_data 3


execute store result entity @s Health float 0.01 run scoreboard players get $health gm4_horse_data
function gm4_horsemanship:horse_processing/cap_health
execute if score $age gm4_horse_data matches ..-1 run function gm4_horsemanship:horse_processing/food/add_age
execute store result entity @s Temper int 1 run scoreboard players get $temper gm4_horse_data
