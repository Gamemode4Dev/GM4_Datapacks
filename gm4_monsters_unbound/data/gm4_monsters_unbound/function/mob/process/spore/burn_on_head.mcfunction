# burn the spore if a spore zombie is on fire
# @s = spore zombie
# at unspecified
# run from main

item replace entity @s armor.head with air
tag @s remove gm4_mu_spore_zombie
tag @s remove gm4_mu_spore_zombie.cherry

execute anchored eyes run particle flame ^ ^0.1 ^-0.1 0.1 0.1 0.1 0.15 8
