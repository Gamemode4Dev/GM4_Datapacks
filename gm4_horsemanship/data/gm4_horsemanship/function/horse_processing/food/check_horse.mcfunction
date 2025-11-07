# check if this gm4_horse was fed by checking if player is looking at it
# @s = gm4_horse
# at @s
# run from horse_processing/food/feed_added_food_untamed
# run from horse_processing/food/feed_original_food

tag @s add gm4_horse_check
scoreboard players set $found_horse gm4_horse_data 0
execute as @p[tag=gm4_horse_check_player] store success score $found_horse gm4_horse_data if predicate gm4_horsemanship:check_horse_looking_at
execute if score $found_horse gm4_horse_data matches 1 run tag @s add gm4_horse_target
tag @s remove gm4_horse_check
