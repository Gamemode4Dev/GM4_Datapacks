# init split entity
# @s = split entity
# at @s
# run from mob/process/elite/splitting/skeleton
# run from mob/process/elite/splitting/zombie

attribute @s attack_damage modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s gravity modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s jump_strength modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s knockback_resistance modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s max_health modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s scale modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s step_height modifier add gm4_monsters_unbound:split_entity -0.5 add_multiplied_total
attribute @s movement_speed modifier add gm4_monsters_unbound:split_entity 0.33 add_multiplied_total
attribute @s[type=#gm4_survival_refightalized:skeleton_types] follow_range modifier add gm4_monsters_unbound:split_entity -0.66 add_multiplied_total

scoreboard players set @s gm4_sr_arrow.fire_delay 6
scoreboard players set @s gm4_sr_arrow.damage_change -14

data modify entity @s CustomName set from storage gm4_monsters_unbound:temp CustomName

execute store result entity @s Motion[0] double 0.01 run random value -30..30
execute store result entity @s Motion[1] double 0.01 run random value 20..60
execute store result entity @s Motion[2] double 0.01 run random value -30..30

tag @s add gm4_mu_elite.split_entity
tag @s add gm4_mu_split_entity
execute if dimension minecraft:overworld run function gm4_survival_refightalized:mob/init/calc_difficulty_overworld
execute unless dimension minecraft:overworld run function gm4_survival_refightalized:mob/init/calc_difficulty_else

item replace entity @s armor.head with spawner
data modify entity @s ArmorDropChances[3] set value -327.670F

team join gm4_mu_elite.split
execute if score $has_bow gm4_mu_data matches 0 run say air
execute if score $has_bow gm4_mu_data matches 0 run item replace entity @s[type=#gm4_survival_refightalized:skeleton_types] weapon.mainhand with wooden_sword
