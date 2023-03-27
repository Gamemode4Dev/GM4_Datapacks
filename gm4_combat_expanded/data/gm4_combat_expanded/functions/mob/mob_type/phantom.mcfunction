# calculate modifiers for newly spawned phantom
# @s = phantom
# at @s
# run from mob/initiate

# calculate stats based on difficulty
execute if score $difficulty gm4_ce_data matches ..7 run attribute @s generic.max_health modifier add 54baf755-966a-451c-a7c3-0aefc1dfd8ee "gm4_ce_modifier_weaker_phantom" -0.5 multiply
execute if score $difficulty gm4_ce_data matches ..3 run attribute @s generic.attack_damage modifier add b97c88de-3c7e-4f7f-8ac0-e664aa3b5dbc "gm4_ce_modifier_weaker_phantom" -0.5 multiply

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
