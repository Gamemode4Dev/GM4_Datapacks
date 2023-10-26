# calculate modifiers for newly spawned blaze
# @s = blaze
# at @s
# run from mob/init/initiate

# base stat nerf
attribute @s generic.attack_damage modifier add 3182427e-beb4-4f9a-9f39-674baf1d5ee4 "gm4_ce_base_damage_nerf" -5 add

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 0
scoreboard players set $mob_damage gm4_ce_data 0
scoreboard players set $mob_speed gm4_ce_data 0
scoreboard players set $mob_armor gm4_ce_data 12
scoreboard players set $mob_toughness gm4_ce_data 12

scoreboard players set $mob_health.cap gm4_ce_data 0
scoreboard players set $mob_damage.cap gm4_ce_data 0
scoreboard players set $mob_speed.cap gm4_ce_data 0
scoreboard players set $mob_armor.cap gm4_ce_data 8
scoreboard players set $mob_toughness.cap gm4_ce_data 8

# translate stat buffs using difficulty
#scoreboard players operation $mob_health gm4_ce_data *= $difficulty gm4_ce_data
#scoreboard players operation $mob_damage gm4_ce_data *= $difficulty gm4_ce_data
#scoreboard players operation $mob_speed gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_toughness gm4_ce_data *= $difficulty gm4_ce_data
#scoreboard players operation $mob_health gm4_ce_data /= #100 gm4_ce_data
#scoreboard players operation $mob_damage gm4_ce_data /= #100 gm4_ce_data
#scoreboard players operation $mob_speed gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_toughness gm4_ce_data /= #100 gm4_ce_data

# set modifiers
function gm4_combat_expanded:mob/init/modifier/stat/prep
