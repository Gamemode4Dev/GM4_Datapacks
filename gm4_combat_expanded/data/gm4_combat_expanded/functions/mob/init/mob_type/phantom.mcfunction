# calculate modifiers for newly spawned phantom
# @s = phantom
# at @s
# run from mob/init/initiate

# TODO: rework phantoms

# calculate stats based on difficulty
attribute @s generic.max_health modifier add 54baf755-966a-451c-a7c3-0aefc1dfd8ee "gm4_ce_modifier_weaker_phantom" -0.5 multiply
attribute @s generic.attack_damage modifier add b97c88de-3c7e-4f7f-8ac0-e664aa3b5dbc "gm4_ce_modifier_weaker_phantom" -0.5 add

# set modifiers (doesn't need to run for Phantoms, they do not deserve buffs)
#function gm4_combat_expanded:mob/init/modifier/stat/prep
