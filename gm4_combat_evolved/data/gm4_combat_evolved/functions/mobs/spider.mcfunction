# run from mobs/initiate
# @s = spider
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_stats gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players add $mob_speed gm4_ce_data 2
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_speed gm4_ce_data 6

# biome specific modifiers for this mob
execute if predicate gm4_combat_evolved:mobs/modifiers/mountainous run effect give @s jump_boost 1000000 1 true
execute if predicate gm4_combat_evolved:mobs/modifiers/burned if predicate gm4_combat_evolved:technical/chance_50 run effect give @s fire_resistance 1000000 0 true
execute if predicate gm4_combat_evolved:mobs/modifiers/lush_caves if predicate gm4_combat_evolved:technical/chance_50 run function gm4_combat_evolved:mobs/biomes/lush_caves_spider
execute if predicate gm4_combat_evolved:mobs/modifiers/toxic run function gm4_combat_evolved:mobs/biomes/toxic_spider
execute if predicate gm4_combat_evolved:mobs/modifiers/growth if entity @s[tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon spider ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_evolved:mobs/modifiers/growth if entity @s[tag=!gm4_ce_extra_mob] if predicate gm4_combat_evolved:technical/chance_50 store success score $mob_extras gm4_ce_data run summon spider ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}

# set modifiers
function gm4_combat_evolved:mobs/modifiers/prep
