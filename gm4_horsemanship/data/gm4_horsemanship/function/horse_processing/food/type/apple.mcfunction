# process horse being fed food
# @s = gm4_horse
# at unspecified
# run from horse_processing/food/feed_original_food

scoreboard players set $food_processed gm4_horse_data 1
tag @s remove gm4_horse_target

function gm4_horsemanship:horse_processing/cap_health


execute unless entity @s[tag=gm4_horse.tamed] run return 0
scoreboard players operation $add_stamina gm4_horse_data = @s gm4_horse.level
scoreboard players add $add_stamina gm4_horse_data 15
scoreboard players operation @s gm4_horse.stamina += $add_stamina gm4_horse_data
scoreboard players operation @s gm4_horse.stamina < @s gm4_horse.stamina_cap
