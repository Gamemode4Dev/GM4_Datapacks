# calculate modifiers for miscelanious entities
# @s = mob of entity type 'basic_modifiers_only'
# at @s
# run from mob/init/initiate

#    List:
# Blaze
# Elder Guardian
# Endermite
# Evoker
# Guardian
# Ravager
# Shulker
# Silverfish
# Witch
# Zoglin

# max stat buffs
scoreboard players set $mob_health gm4_ce_data 15
scoreboard players set $mob_damage gm4_ce_data 11
scoreboard players set $mob_speed gm4_ce_data 15
scoreboard players set $mob_armor gm4_ce_data 7
scoreboard players set $mob_toughness gm4_ce_data 0

scoreboard players set $mob_health.cap gm4_ce_data 6
scoreboard players set $mob_damage.cap gm4_ce_data 5
scoreboard players set $mob_speed.cap gm4_ce_data 7
scoreboard players set $mob_armor.cap gm4_ce_data 4
scoreboard players set $mob_toughness.cap gm4_ce_data 0

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
