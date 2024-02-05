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
scoreboard players set $mob_health gm4_ce_data 6
scoreboard players set $mob_damage gm4_ce_data 25
scoreboard players set $mob_speed gm4_ce_data 14
scoreboard players set $mob_armor gm4_ce_data 4
scoreboard players set $mob_toughness gm4_ce_data 0
# max damage mob is allowed to deal in one hit
scoreboard players set @s gm4_ce_damage_cap 9001

# set modifiers
execute unless score $replaced_mob gm4_ce_data matches 1 run function gm4_combat_expanded:mob/init/modifier/stat/prep
scoreboard players reset $replaced_mob gm4_ce_data
