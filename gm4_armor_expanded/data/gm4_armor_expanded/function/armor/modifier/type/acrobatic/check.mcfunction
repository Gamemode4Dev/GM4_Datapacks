# check if armor should activate
# @s = player being checked
# at unspecified
# run from armor/check_modifier/safety

# get immunities if player is safe
execute unless score @s gm4_ae_combat_regen_timer matches 1.. run function gm4_armor_expanded:armor/modifier/type/acrobatic/get_immunities

# activate armor if player is regenerating again
execute unless score @s gm4_ae_combat_regen_timer matches 1.. if score $active gm4_ae_data matches 0 run function gm4_armor_expanded:armor/modifier/type/acrobatic/activate

# otherwise deactivate armor
execute if score @s gm4_ae_combat_regen_timer matches 1.. if score $active gm4_ae_data matches 1 run function gm4_armor_expanded:armor/modifier/type/acrobatic/deactivate