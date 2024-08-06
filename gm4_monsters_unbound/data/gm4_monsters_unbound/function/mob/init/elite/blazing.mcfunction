
tag @s add gm4_mu_elite
tag @s add gm4_mu_elite.process
tag @s add gm4_mu_elite.blazing
tag @s add gm4_mu_fire_attack

attribute @s generic.max_health modifier add gm4_monsters_unbound:elite_buff.fire 2.5 add_multiplied_total
attribute @s generic.attack_damage modifier add gm4_monsters_unbound:elite_buff.fire -0.99 add_multiplied_total
attribute @s generic.movement_speed modifier add gm4_monsters_unbound:elite_buff.fire -0.45 add_multiplied_total
attribute @s generic.burning_time modifier add gm4_monsters_unbound:elite_buff.fire -1 add_multiplied_total

item replace entity @s armor.head with magma_block
data modify entity @s ArmorDropChances[3] set value -327.670F

team join gm4_mu_elite.blazing
