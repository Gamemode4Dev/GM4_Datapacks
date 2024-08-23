
tag @s add gm4_mu_elite.gargantuan
tag @s add gm4_mu_elite.process

attribute @s[type=!#gm4_survival_refightalized:skeleton_types] generic.max_health modifier add gm4_monsters_unbound:elite_buff.giant 5.5 add_multiplied_total
attribute @s[type=#gm4_survival_refightalized:skeleton_types] generic.max_health modifier add gm4_monsters_unbound:elite_buff.giant 3.5 add_multiplied_total

attribute @s generic.scale modifier add gm4_monsters_unbound:elite_buff.giant 0.5 add_multiplied_total
attribute @s generic.gravity modifier add gm4_monsters_unbound:elite_buff.giant 0.5 add_multiplied_total
attribute @s generic.jump_strength modifier add gm4_monsters_unbound:elite_buff.giant 0.5 add_multiplied_total
attribute @s generic.attack_knockback modifier add gm4_monsters_unbound:elite_buff.giant 1.75 add_value
attribute @s generic.water_movement_efficiency modifier add gm4_monsters_unbound:elite_buff.giant 0.85 add_value
attribute @s generic.movement_speed modifier add gm4_monsters_unbound:elite_buff.giant -0.35 add_multiplied_total

enchant @s[type=#gm4_survival_refightalized:skeleton_types] punch 2
enchant @s[type=#gm4_survival_refightalized:skeleton_types] power 1

scoreboard players set @s[type=#gm4_survival_refightalized:skeleton_types] gm4_sr_arrow_fire_delay 7

item replace entity @s armor.head with cobblestone[minecraft:enchantments={"projectile_protection":4}] 1 
data modify entity @s ArmorDropChances[3] set value -327.670F

team join gm4_mu_elite.gargantuan
