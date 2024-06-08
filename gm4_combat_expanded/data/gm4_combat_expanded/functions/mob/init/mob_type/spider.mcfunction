# calculate modifiers for newly spawned spider
# @s = spider
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -6 add_value
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -0.5 add_value
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.06 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 12
scoreboard players set $mob_damage gm4_ce_data 40
scoreboard players set $mob_speed gm4_ce_data 56
scoreboard players set $mob_armor gm4_ce_data 4
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 65

# | Biome Modifiers
# snowy
tag @s[type=spider,predicate=gm4_combat_expanded:mob/modifier/snowy] add gm4_ce_slowing_attacks
# mountainous
effect give @s[predicate=gm4_combat_expanded:mob/modifier/mountainous,predicate=gm4_combat_expanded:technical/chance/spider_speed] speed infinite 0
# burned
effect give @s[predicate=gm4_combat_expanded:mob/modifier/burned,predicate=gm4_combat_expanded:technical/chance/spider_fire_resist] fire_resistance infinite 0
# flowering 
execute if predicate gm4_combat_expanded:mob/modifier/lush_caves if predicate gm4_combat_expanded:technical/chance/spider_replace run function gm4_combat_expanded:mob/init/modifier/special/lush_caves_spider
# toxic
execute if predicate gm4_combat_expanded:mob/modifier/toxic run function gm4_combat_expanded:mob/init/modifier/special/toxic_spider
# growth
execute if entity @s[tag=!gm4_ce_extra_mob,predicate=gm4_combat_expanded:mob/modifier/growth] store success score $mob_extras gm4_ce_data run summon spider ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if entity @s[tag=!gm4_ce_extra_mob,predicate=gm4_combat_expanded:mob/modifier/growth,predicate=gm4_combat_expanded:technical/chance/extra_spider_spawn] store success score $mob_extras gm4_ce_data run summon spider ~ ~ ~ {Tags:["gm4_ce_extra_mob"]}
# dark
effect give @s[predicate=gm4_combat_expanded:mob/modifier/dark,predicate=gm4_combat_expanded:technical/chance/spider_invisibility] invisibility infinite 0

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
