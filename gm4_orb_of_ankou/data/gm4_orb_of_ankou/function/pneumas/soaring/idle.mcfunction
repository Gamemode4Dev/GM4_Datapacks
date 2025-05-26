# @s = player with soaring pneuma looking straight
# run from pneumas/soaring/apply

effect clear @s levitation
tp @s
attribute @s minecraft:gravity modifier add gm4_orb_of_ankou:soaring_gravity -0.08 add_value
tag @s add gm4_oa_soaring_idle
