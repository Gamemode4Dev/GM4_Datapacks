# calculate modifiers for newly spawned cave spider
# @s = cave spider
# at @s
# run from mob/init/initiate

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -16 add
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -1.5 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.12 multiply_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 20
scoreboard players set $mob_damage gm4_ce_data 7
scoreboard players set $mob_speed gm4_ce_data 36
scoreboard players set $mob_armor gm4_ce_data 0
scoreboard players set $mob_toughness gm4_ce_data 0

# translate stat buffs using difficulty
scoreboard players operation $mob_health gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_damage gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data *= $difficulty gm4_ce_data
#scoreboard players operation $mob_armor gm4_ce_data *= $difficulty gm4_ce_data
#scoreboard players operation $mob_toughness gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_health gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_damage gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data /= #100 gm4_ce_data
#scoreboard players operation $mob_armor gm4_ce_data /= #100 gm4_ce_data
#scoreboard players operation $mob_toughness gm4_ce_data /= #100 gm4_ce_data

# | Biome Modifiers
# mountainous
effect give @s[predicate=gm4_combat_expanded:mob/modifier/mountainous] jump_boost infinite 1
# burned
effect give @s[predicate=gm4_combat_expanded:mob/modifier/burned,predicate=gm4_combat_expanded:technical/chance/spider_fire_resist] fire_resistance infinite 0
# flowering 
execute if predicate gm4_combat_expanded:mob/modifier/lush_caves run function gm4_combat_expanded:mob/init/modifier/special/lush_caves_spider
# toxic
tag @s[predicate=gm4_combat_expanded:mob/modifier/toxic] add gm4_ce_poison_bite
# growth
execute if entity @s[tag=!gm4_ce_extra_mob,predicate=gm4_combat_expanded:mob/modifier/growth] store success score $mob_extras gm4_ce_data run summon cave_spider ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if entity @s[tag=!gm4_ce_extra_mob,predicate=gm4_combat_expanded:mob/modifier/growth,predicate=gm4_combat_expanded:technical/chance/extra_spider_spawn] store success score $mob_extras gm4_ce_data run summon cave_spider ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}

# set modifiers
function gm4_combat_expanded:mob/init/modifier/stat/prep
