# calculate modifiers for newly spawned enderman
# @s = enderman
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s[predicate=!gm4_combat_expanded:mob/modifier/the_end] generic.max_health modifier add gm4_combat_expanded:stat_change.base_nerf -2 add_value
attribute @s generic.attack_damage modifier add gm4_combat_expanded:stat_change.base_nerf -3 add_value
attribute @s generic.movement_speed modifier add gm4_combat_expanded:stat_change.base_nerf -0.1 add_multiplied_base

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
execute if predicate gm4_combat_expanded:mob/modifier/flowering if predicate gm4_combat_expanded:technical/chance/replace_enderman_slime run function gm4_combat_expanded:mob/init/mob_type/enderman/flowering
# the end
attribute @s[predicate=gm4_combat_expanded:mob/modifier/the_end] generic.attack_damage modifier add gm4_combat_expanded:stat_change.the_end 0.2 add_multiplied_base
attribute @s[predicate=gm4_combat_expanded:mob/modifier/the_end] generic.movement_speed modifier add gm4_combat_expanded:stat_change.the_end 0.15 add_multiplied_base
# warped forest
execute if predicate gm4_combat_expanded:mob/modifier/nether/warped_forest if predicate gm4_combat_expanded:technical/chance/extra_enderman run function gm4_combat_expanded:mob/init/mob_type/enderman/warped_forest
# nether wastes
execute if predicate gm4_combat_expanded:mob/modifier/nether/nether_wastes if predicate gm4_combat_expanded:technical/chance/replace_enderman_blaze run function gm4_combat_expanded:mob/init/mob_type/enderman/nether_wastes
# soul sand valley
execute if predicate gm4_combat_expanded:mob/modifier/nether/soul_sand_valley if predicate gm4_combat_expanded:technical/chance/replace_enderman_wither_skeleton run function gm4_combat_expanded:mob/init/mob_type/enderman/soul_sand_valley
