# calculate modifiers for newly spawned blaze
# @s = blaze
# at @s
# run from mob/initiate

# calculate stats based on difficulty
scoreboard players operation $mob_armor gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches ..3 run attribute @s generic.attack_damage modifier add 697ef750-9a49-4c73-a780-188b7a4f4303 "gm4_ce_modifier_weaker_blaze" -0.75 multiply
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_armor gm4_ce_data 5
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_damage gm4_ce_data 4
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_toughness gm4_ce_data 5

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
