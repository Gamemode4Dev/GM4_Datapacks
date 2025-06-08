# process horse being fed food
# @s = gm4_horse
# at @s
# run from need/food/feed_original_food

tag @s remove gm4_horse_target

# restore health
execute store result score $max_health gm4_horse_data run attribute @s max_health get 100
scoreboard players remove $max_health gm4_horse_data 101
execute store result score $curr_health gm4_horse_data run data get entity @s Health 100
execute if score $curr_health gm4_horse_data > $max_health gm4_horse_data store result entity @s Health float 0.01 run scoreboard players get $max_health gm4_horse_data

scoreboard players set $food_processed gm4_horse_data 1

# Also enables breeding
