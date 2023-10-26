# calculate modifiers for miscelanious entities
# @s = mob of entity type 'basic_modifiers_only'
# at @s
# run from mob/init/initiate

#    List:
# Elder Guardian
# Endermite
# Evoker
# Guardian
# Hoglin
# Pillager
# Ravager
# Shulker
# Silverfish
# Vindicator
# Witch
# Zoglin

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 15
scoreboard players set $mob_damage gm4_ce_data 11
scoreboard players set $mob_speed gm4_ce_data 15
scoreboard players set $mob_armor gm4_ce_data 7
scoreboard players set $mob_toughness gm4_ce_data 7

# translate stat buffs using difficulty
scoreboard players operation $mob_health gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_damage gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_toughness gm4_ce_data *= $difficulty gm4_ce_data
scoreboard players operation $mob_health gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_damage gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_speed gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_armor gm4_ce_data /= #100 gm4_ce_data
scoreboard players operation $mob_toughness gm4_ce_data /= #100 gm4_ce_data

# set modifiers
function gm4_combat_expanded:mob/init/modifier/stat/prep
