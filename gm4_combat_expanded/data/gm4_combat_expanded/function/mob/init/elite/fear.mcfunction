
tag @s add gm4_ce_elite
tag @s add gm4_ce_elite.process
tag @s add gm4_ce_elite.fear

attribute @s generic.max_health modifier add gm4_combat_expanded:elite_buff.fear 2.5 add_multiplied_total

item replace entity @s armor.head with black_wool
data modify entity @s ArmorDropChances[3] set value -327.670F
