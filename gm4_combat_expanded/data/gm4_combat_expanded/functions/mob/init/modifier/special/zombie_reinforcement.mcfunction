# tags zombies spawned from reinforcements
# @s = reinforcement callee zombie
# at @s
# run from mob/init/mob_type/zombie

tag @s add gm4_ce_zombie_reinforcement
# have no droprate
data merge entity @s {ArmorDropChances:[0F,0F,0F,0F],HandDropChances:[0F,0F]}
