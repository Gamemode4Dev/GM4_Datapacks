# pick this elite type to spawn
# @s = zombie / skeleton types
# at @s
# run from mob/init/elite/pick

tag @s add gm4_mu_elite.process
tag @s add gm4_mu_elite.zephyr

effect give @s wind_charged infinite 0 true

attribute @s minecraft:max_health modifier add gm4_monsters_unbound:elite_buff.speed 2.5 add_multiplied_total
attribute @s minecraft:movement_speed modifier add gm4_monsters_unbound:elite_buff.speed 0.15 add_multiplied_total
attribute @s minecraft:attack_knockback modifier add gm4_monsters_unbound:elite_buff.speed 0.5 add_value
attribute @s minecraft:fall_damage_multiplier modifier add gm4_monsters_unbound:elite_buff.speed -1 add_multiplied_total

attribute @s[type=#gm4_survival_refightalized:skeleton_types] minecraft:scale modifier add gm4_monsters_unbound:elite_buff.size 0.005025 add_multiplied_total
attribute @s[type=!#gm4_survival_refightalized:skeleton_types] minecraft:scale modifier add gm4_monsters_unbound:elite_buff.size 0.025641 add_multiplied_total

item replace entity @s armor.head with white_wool
data modify entity @s ArmorDropChances[3] set value -327.670F

team join gm4_mu_elite.zephyr

scoreboard players set @s gm4_sr_arrow.fire_delay 0
scoreboard players set @s gm4_sr_arrow.damage_change -15
