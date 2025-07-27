# process horse being fed food
# @s = gm4_horse
# at @s
# run from need/food/feed_original_food

tag @s remove gm4_horse_target

tag @s add gm4_horse.check_health

scoreboard players set $food_processed gm4_horse_data 1
