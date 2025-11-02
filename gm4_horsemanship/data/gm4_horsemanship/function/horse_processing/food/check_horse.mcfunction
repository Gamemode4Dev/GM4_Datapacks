# check if this gm4_horse was fed by checking if player is looking at it
# @s = gm4_horse
# at @s
# run from horse_processing/food/feed_added_food_untamed
# run from horse_processing/food/feed_original_food

tag @s add gm4_horse_check
execute as @p[tag=gm4_horse_check_player] if predicate gm4_horsemanship:check_horse_looking_at run tag @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_check,distance=..8,limit=1] add gm4_horse_target
tag @s remove gm4_horse_check
