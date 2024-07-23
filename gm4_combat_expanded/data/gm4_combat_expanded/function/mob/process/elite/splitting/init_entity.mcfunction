
attribute @s generic.attack_damage modifier add gm4_combat_expanded:split_entity -0.5 add_multiplied_total
attribute @s generic.gravity modifier add gm4_combat_expanded:split_entity -0.5 add_multiplied_total
attribute @s generic.jump_strength modifier add gm4_combat_expanded:split_entity -0.5 add_multiplied_total
attribute @s generic.knockback_resistance modifier add gm4_combat_expanded:split_entity -0.5 add_multiplied_total
attribute @s generic.max_health modifier add gm4_combat_expanded:split_entity -0.5 add_multiplied_total
attribute @s generic.scale modifier add gm4_combat_expanded:split_entity -0.5 add_multiplied_total
attribute @s generic.step_height modifier add gm4_combat_expanded:split_entity -0.5 add_multiplied_total
attribute @s generic.movement_speed modifier add gm4_combat_expanded:split_entity 0.33 add_multiplied_total
attribute @s[type=skeleton] generic.follow_range modifier add gm4_combat_expanded:split_entity -0.66 add_multiplied_total

scoreboard players set @s[type=skeleton] gm4_ce_arrow_fire_delay 3

data modify entity @s Motion set from storage gm4_combat_expanded:temp set.motion

tag @s add gm4_ce_weak_arrow
tag @s add gm4_ce_split_entity
function gm4_combat_expanded:mob/init/calc_difficulty_base

item replace entity @s armor.head with spawner
data modify entity @s ArmorDropChances[3] set value -327.670F

team join gm4_ce_elite.split
