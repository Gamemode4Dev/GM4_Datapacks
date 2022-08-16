# calculate modifiers for newly spawned spider
# @s = spider
# at @s
# run from mob/initiate

# calculate stats based on difficulty
scoreboard players operation $mob_stats gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players add $mob_speed gm4_ce_data 2
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_speed gm4_ce_data 6

# biome specific modifiers for this mob
effect give @s[predicate=gm4_combat_expanded:mob/modifier/dark,predicate=gm4_combat_expanded:technical/chance/spider_invisibility] invisibility 1000000 0
effect give @s[predicate=gm4_combat_expanded:mob/modifier/mountainous] jump_boost 1000000 1
effect give @s[predicate=gm4_combat_expanded:mob/modifier/burned,predicate=gm4_combat_expanded:technical/chance/spider_fire_resist] fire_resistance 1000000 0
execute if predicate gm4_combat_expanded:mob/modifier/lush_caves if predicate gm4_combat_expanded:technical/chance/spider_replace run function gm4_combat_expanded:mob/effect/lush_caves_spider
execute if predicate gm4_combat_expanded:mob/modifier/toxic run function gm4_combat_expanded:mob/effect/toxic_spider
execute if entity @s[predicate=gm4_combat_expanded:mob/modifier/growth,tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon spider ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if entity @s[predicate=gm4_combat_expanded:mob/modifier/growth,predicate=gm4_combat_expanded:technical/chance/extra_spider_spawn,tag=!gm4_ce_extra_mob] store success score $mob_extras gm4_ce_data run summon spider ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
