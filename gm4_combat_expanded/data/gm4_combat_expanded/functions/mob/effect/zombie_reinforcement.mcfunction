# tags zombies spawned from reinforcements
# @s = reinforcement callee zombie
# at @s
# run from mob/mob_type/zombie

tag @s add gm4_ce_zombie_reinforcement
# have 1/4th droprate
data merge entity @s {ArmorDropChances:[0.0226F,0.0226F,0.0226F,0.0226F],HandDropChances:[0.0226F,0.0226F]}
