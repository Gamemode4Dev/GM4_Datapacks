# run from mobs/initiate
# @s = blaze
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_health gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches ..3 run attribute @s generic.attack_damage modifier add 697ef750-9a49-4c73-a780-188b7a4f4303 "gm4_ce_modifier_weaker_blaze" -0.75 multiply
execute if score $difficulty gm4_ce_data matches 8.. run scoreboard players add $mob_armor gm4_ce_data 5
execute if score $difficulty gm4_ce_data matches 11.. run scoreboard players add $mob_damage gm4_ce_data 4

# set modifiers
function gm4_combat_evolved:mobs/modifiers/prep