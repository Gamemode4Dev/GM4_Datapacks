# pick this elite type to spawn
# @s = zombie / skeleton types
# at @s
# run from mob/init/elite/pick

tag @s add gm4_mu_elite.process
tag @s add gm4_mu_elite.blazing

attribute @s minecraft:max_health modifier add gm4_monsters_unbound:elite_buff.fire 2.5 add_multiplied_total
attribute @s minecraft:attack_damage modifier add gm4_monsters_unbound:elite_buff.fire -0.99 add_multiplied_total
attribute @s minecraft:movement_speed modifier add gm4_monsters_unbound:elite_buff.fire -0.45 add_multiplied_total
attribute @s minecraft:burning_time modifier add gm4_monsters_unbound:elite_buff.fire -1 add_multiplied_total

enchant @s[type=#gm4_survival_refightalized:skeleton_types] flame
scoreboard players set @s[type=#gm4_survival_refightalized:skeleton_types] gm4_sr_arrow.damage_change -18
scoreboard players add @s[type=#gm4_survival_refightalized:skeleton_types] gm4_sr_arrow.fire_delay 2
item replace entity @s[type=!#gm4_survival_refightalized:skeleton_types] weapon.mainhand with blaze_rod[enchantments={fire_aspect:2}]
data modify entity @s HandDropChances[0] set value -327.670F

item replace entity @s armor.head with magma_block
data modify entity @s ArmorDropChances[3] set value -327.670F

team join gm4_mu_elite.blazing
