# calculate modifiers for miscelanious entities
# @s = mob of entity type 'basic_modifiers_only'
# at @s
# run from mob/initiate

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

# calculate stats based on difficulty
scoreboard players operation $mob_stats gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 4.. run scoreboard players add $mob_armor gm4_ce_data 2
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_armor gm4_ce_data 2
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_armor gm4_ce_data 3

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
