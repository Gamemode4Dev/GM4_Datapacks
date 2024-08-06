
tag @s add gm4_mu_elite
tag @s add gm4_mu_elite.process
tag @s add gm4_mu_elite.zephyr

effect give @s wind_charged infinite 0 true

attribute @s generic.max_health modifier add gm4_monsters_unbound:elite_buff.speed 2 add_multiplied_total
attribute @s generic.movement_speed modifier add gm4_monsters_unbound:elite_buff.speed 0.15 add_multiplied_total
attribute @s generic.attack_knockback modifier add gm4_monsters_unbound:elite_buff.speed 0.5 add_value
attribute @s generic.fall_damage_multiplier modifier add gm4_monsters_unbound:elite_buff.speed -1 add_multiplied_total

item replace entity @s armor.head with white_wool
data modify entity @s ArmorDropChances[3] set value -327.670F

team join gm4_mu_elite.zephyr
