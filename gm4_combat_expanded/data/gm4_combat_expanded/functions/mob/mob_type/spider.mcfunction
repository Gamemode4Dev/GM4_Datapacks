# calculate modifiers for newly spawned spider
# @s = spider
# at @s
# run from mob/initiate

# calculate stats based on difficulty
scoreboard players operation $mob_stats gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players add $mob_speed gm4_ce_data 2
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_speed gm4_ce_data 6

# biome specific modifiers for this mob
execute if predicate gm4_combat_expanded:mob/modifier/mountainous run effect give @s jump_boost 1000000 1
execute if predicate gm4_combat_expanded:mob/modifier/burned if predicate gm4_combat_expanded:technical/chance_50 run effect give @s fire_resistance 1000000 0
execute if predicate gm4_combat_expanded:mob/modifier/lush_caves if predicate gm4_combat_expanded:technical/chance_50 run function gm4_combat_expanded:mob/effect/lush_caves_spider
execute if predicate gm4_combat_expanded:mob/modifier/toxic run function gm4_combat_expanded:mob/effect/toxic_spider
execute if predicate gm4_combat_expanded:mob/modifier/growth if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon spider ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:mob/modifier/growth if entity @s[tag=!gm4_ce_extra_mob] if predicate gm4_combat_expanded:technical/chance_50 store success score $mob_extras gm4_ce_data run summon spider ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
