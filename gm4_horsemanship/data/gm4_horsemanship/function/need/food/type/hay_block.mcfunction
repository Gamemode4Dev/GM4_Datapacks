# process horse being fed food
# @s = gm4_horse
# at @s
# run from need/food/feed_original_food

scoreboard players set $food_processed gm4_horse_data 1
tag @s remove gm4_horse_target

function gm4_horsemanship:horse_processing/cap_health

execute unless entity @s[tag=gm4_horse.tamed] run return 0
scoreboard players remove @s gm4_horse.stamina 25
scoreboard players operation @s gm4_horse.stamina > #0 gm4_horse_data
