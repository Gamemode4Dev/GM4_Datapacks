# calculate modifiers for newly spawned enderman
# @s = enderman
# at @s
# run from mob/init/initiate

# base stat nerf
attribute @s[predicate=!gm4_combat_expanded:mob/modifier/the_end] generic.max_health modifier add e94edf94-a98a-4dcc-bb23-2b59890663fd "gm4_ce_base_health_nerf" -2 add
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -3 add
attribute @s generic.movement_speed modifier add 811e516b-a6b2-40e4-b56e-0ffd7173297b "gm4_ce_base_speed_nerf" -0.1 multiply

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 10
scoreboard players set $mob_damage gm4_ce_data 16
scoreboard players set $mob_speed gm4_ce_data 8
scoreboard players set $mob_armor gm4_ce_data 26
scoreboard players set $mob_toughness gm4_ce_data 0

scoreboard players set $mob_health.cap gm4_ce_data 10
scoreboard players set $mob_damage.cap gm4_ce_data 12
scoreboard players set $mob_speed.cap gm4_ce_data 8
scoreboard players set $mob_armor.cap gm4_ce_data 9
scoreboard players set $mob_toughness.cap gm4_ce_data 0

# translate stat buffs using difficulty
scoreboard players operation $mob_health gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_damage gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data *= $difficulty gm4_ce_data
#scoreboard players operation $mob_toughness gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_health gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_damage gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data /= #100 gm4_ce_data
#scoreboard players operation $mob_toughness gm4_ce_data /= #100 gm4_ce_data

# | Biome Modifiers
# flowering 
execute if predicate gm4_combat_expanded:mob/modifier/flowering if predicate gm4_combat_expanded:technical/chance/replace_enderman run function gm4_combat_expanded:mob/init/modifier/special/flowering_enderman
# the end
attribute @s[predicate=gm4_combat_expanded:mob/modifier/the_end] generic.attack_damage modifier add 0872b8ed-f482-4a29-94dc-22df9a28dddb "gm4_ce_modifier_end" 0.2 multiply
attribute @s[predicate=gm4_combat_expanded:mob/modifier/the_end] generic.movement_speed modifier add 17004032-9186-4202-b662-14841061fbb2 "gm4_ce_modifier_end" 0.15 multiply
# warped forest

# set modifiers
function gm4_combat_expanded:mob/init/modifier/stat/prep
