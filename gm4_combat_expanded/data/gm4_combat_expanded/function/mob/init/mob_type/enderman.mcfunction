# calculate modifiers for newly spawned enderman
# @s = enderman
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s[predicate=!gm4_combat_expanded:mob/modifier/the_end] generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -2 add_value
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -3 add_value
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.1 add_multiplied_base

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 16
scoreboard players set $mob_damage gm4_ce_data 65
scoreboard players set $mob_speed gm4_ce_data 20
scoreboard players set $mob_armor gm4_ce_data 9
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 140

# | Biome Modifiers
# flowering 
execute if predicate gm4_combat_expanded:mob/modifier/flowering if predicate gm4_combat_expanded:technical/chance/replace_enderman_slime run function gm4_combat_expanded:mob/init/modifier/special/flowering_enderman
# the end
attribute @s[predicate=gm4_combat_expanded:mob/modifier/the_end] generic.attack_damage modifier add 0872b8ed-f482-4a29-94dc-22df9a28dddb "gm4_ce_modifier_end" 0.2 add_multiplied_base
attribute @s[predicate=gm4_combat_expanded:mob/modifier/the_end] generic.movement_speed modifier add 17004032-9186-4202-b662-14841061fbb2 "gm4_ce_modifier_end" 0.15 add_multiplied_base
# warped forest
execute if predicate gm4_combat_expanded:mob/modifier/nether/warped_forest if predicate gm4_combat_expanded:technical/chance/extra_enderman run function gm4_combat_expanded:mob/init/modifier/special/warped_forest_enderman
# nether wastes
execute if predicate gm4_combat_expanded:mob/modifier/nether/nether_wastes if predicate gm4_combat_expanded:technical/chance/replace_enderman_blaze run function gm4_combat_expanded:mob/init/modifier/special/nether_wastes_enderman
# soul sand valley
execute if predicate gm4_combat_expanded:mob/modifier/nether/soul_sand_valley if predicate gm4_combat_expanded:technical/chance/replace_enderman_wither_skeleton run function gm4_combat_expanded:mob/init/modifier/special/soul_sand_valley_enderman

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
