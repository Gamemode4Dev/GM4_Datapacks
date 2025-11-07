# process horse being fed food
# @s = gm4_horse
# at unspecified
# run from horse_processing/food/feed_original_food

scoreboard players set $food_processed gm4_horse_data 1
tag @s remove gm4_horse_target

function gm4_horsemanship:horse_processing/cap_health
