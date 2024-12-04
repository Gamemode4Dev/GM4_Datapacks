# pick this elite type to spawn
# @s = zombie / skeleton types
# at @s
# run from mob/init/elite/pick

tag @s add gm4_mu_elite.gargantuan
tag @s add gm4_mu_elite.process

attribute @s max_health modifier add gm4_monsters_unbound:elite_buff.giant 5.5 add_multiplied_total
attribute @s gravity modifier add gm4_monsters_unbound:elite_buff.giant 0.5 add_multiplied_total
attribute @s jump_strength modifier add gm4_monsters_unbound:elite_buff.giant 0.5 add_multiplied_total
attribute @s attack_knockback modifier add gm4_monsters_unbound:elite_buff.giant 1.75 add_value
attribute @s water_movement_efficiency modifier add gm4_monsters_unbound:elite_buff.giant 0.85 add_value
attribute @s movement_speed modifier add gm4_monsters_unbound:elite_buff.giant -0.35 add_multiplied_total

attribute @s[type=#gm4_survival_refightalized:skeleton_types] scale modifier add gm4_monsters_unbound:elite_buff.giant_size 0.507537 add_multiplied_total
attribute @s[type=!#gm4_survival_refightalized:skeleton_types] scale modifier add gm4_monsters_unbound:elite_buff.giant_size 0.538461 add_multiplied_total

enchant @s[type=#gm4_survival_refightalized:skeleton_types] punch 2
enchant @s[type=#gm4_survival_refightalized:skeleton_types] power 1

scoreboard players set @s[type=#gm4_survival_refightalized:skeleton_types] gm4_sr_arrow.fire_delay 7

item replace entity @s armor.head with cobblestone[enchantment_glint_override=false,minecraft:enchantments={"projectile_protection":5}] 1 
data modify entity @s ArmorDropChances[3] set value -327.670F

team join gm4_mu_elite.gargantuan
