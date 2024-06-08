# calculate modifiers for newly spawned guardian
# @s = guardian
# at @s
# run from mob/init/mob_type

# base stat nerf
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -3 add_value

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 0
scoreboard players set $mob_damage gm4_ce_data 60
scoreboard players set $mob_speed gm4_ce_data 0
scoreboard players set $mob_armor gm4_ce_data 0
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 90

# | Biome Modifiers
# reef
execute if predicate gm4_combat_expanded:mob/modifier/reef run scoreboard players set $mob_damage gm4_ce_data 90
scoreboard players set @s[predicate=gm4_combat_expanded:mob/modifier/reef] gm4_ce_damage_cap 120

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
