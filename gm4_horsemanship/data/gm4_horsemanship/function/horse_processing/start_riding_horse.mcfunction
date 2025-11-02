# process a player that just mounted a horse with gm4_horse tag (or equivalent)
# @s = player riding the horse
# at @s (before mounting)
advancement revoke @s only gm4_horsemanship:start_riding_horse

# check for food
execute if predicate gm4_horsemanship:holding_food run function gm4_horsemanship:horse_processing/food/feed_added_food
