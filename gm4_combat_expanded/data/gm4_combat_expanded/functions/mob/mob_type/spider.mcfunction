# calculate modifiers for newly spawned spider
# @s = spider
# at @s
# run from mob/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -4 add
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -1 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.04 multiply_base

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
execute if entity @s[tag=!gm4_ce_extra_mob,predicate=gm4_combat_expanded:mob/modifier/growth] store success score $mob_extras gm4_ce_data run summon spider ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if entity @s[tag=!gm4_ce_extra_mob,predicate=gm4_combat_expanded:mob/modifier/growth,predicate=gm4_combat_expanded:technical/chance/extra_spider_spawn] store success score $mob_extras gm4_ce_data run summon spider ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
