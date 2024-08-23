
attribute @s generic.attack_damage modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s generic.gravity modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s generic.jump_strength modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s generic.knockback_resistance modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s generic.max_health modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s generic.scale modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s generic.step_height modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s generic.movement_speed modifier add gm4_monsters_unbound:split_entity 0.33 add_multiplied_total
attribute @s[type=#gm4_survival_refightalized:skeleton_types] generic.follow_range modifier add gm4_monsters_unbound:split_entity -0.66 add_multiplied_total

scoreboard players set @s[type=#gm4_survival_refightalized:skeleton_types] gm4_sr_arrow_fire_delay 5

data modify entity @s Motion set from storage gm4_monsters_unbound:temp set.motion

tag @s add gm4_mu_elite
scoreboard players set @s gm4_sr_arrow_damage_change -10
tag @s add gm4_mu_split_entity
function gm4_survival_refightalized:mob/init/calc_difficulty_base

item replace entity @s armor.head with spawner
data modify entity @s ArmorDropChances[3] set value -327.670F

team join gm4_mu_elite.split
