# run from mobs/initiate
# @s = spider
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_stats gm4_ai_data += $difficulty gm4_ai_data
execute if score $difficulty gm4_ai_data matches 4.. run scoreboard players add $mob_speed gm4_ai_data 2
execute if score $difficulty gm4_ai_data matches 11.. run scoreboard players add $mob_speed gm4_ai_data 6

# biome specific modifiers for this mob
execute if predicate gm4_armor_identification:mobs/modifiers/mountainous run effect give @s jump_boost 1000000 1 true
execute if predicate gm4_armor_identification:mobs/modifiers/burned if predicate gm4_armor_identification:technical/chance_50 run effect give @s fire_resistance 1000000 0 true
execute if predicate gm4_armor_identification:mobs/modifiers/lush_caves run function gm4_armor_identification:mobs/biomes/lush_caves_spider
execute if predicate gm4_armor_identification:mobs/modifiers/toxic run function gm4_armor_identification:mobs/biomes/toxic_spider
execute if predicate gm4_armor_identification:mobs/modifiers/growth if entity @s[tag=!gm4_ai_extra_mob] store success score $mob_extras gm4_ai_data run summon spider ~ ~ ~ {Tags:["gm4_ai_extra_mob"]}
execute if predicate gm4_armor_identification:mobs/modifiers/growth if entity @s[tag=!gm4_ai_extra_mob] if predicate gm4_armor_identification:technical/chance_50 store success score $mob_extras gm4_ai_data run summon spider ~ ~ ~ {Tags:["gm4_ai_extra_mob"]}

# set modifiers
function gm4_armor_identification:mobs/modifiers/prep
