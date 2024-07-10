
tag @s add gm4_ce_elite
tag @s add gm4_ce_elite.process
tag @s add gm4_ce_elite.heal

attribute @s generic.max_health modifier add gm4_combat_expanded:elite_buff.heal 1.5 add_multiplied_total
attribute @s generic.movement_speed modifier add gm4_combat_expanded:elite_buff.heal -0.25 add_multiplied_total

item replace entity @s armor.head with lime_glazed_terracotta
data modify entity @s ArmorDropChances[3] set value -327.670F
