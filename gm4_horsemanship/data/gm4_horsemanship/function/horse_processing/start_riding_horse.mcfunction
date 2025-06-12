# process a player that just mounted a horse with gm4_horse tag (or equivalent)
# @s = player riding the horse
# at @s (before mounting)
advancement revoke @s only gm4_horsemanship:start_riding_horse

scoreboard players set $interaction_resolved gm4_horse_data 0

# check for brushing
execute if score $interaction_resolved gm4_horse_data matches 0 if predicate gm4_horsemanship:holding_brush run function gm4_horsemanship:need/care/brush/process

# check for food
execute if score $interaction_resolved gm4_horse_data matches 0 if predicate gm4_horsemanship:holding_food run function gm4_horsemanship:need/food/feed_added_food
