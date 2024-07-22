
tag @s add gm4_ce_elite
tag @s add gm4_ce_slowing_attacks
tag @s add gm4_ce_elite.glacial

tag @s add gm4_ce_elite.on_death
summon marker ~ ~ ~ {Tags:["gm4_ce_elite_death_marker","gm4_ce_elite.glacial"]}
ride @e[type=marker,tag=gm4_ce_elite_death_marker,limit=1,sort=nearest] mount @s

attribute @s generic.max_health modifier add gm4_combat_expanded:elite_buff.frost 2.5 add_multiplied_total
attribute @s generic.knockback_resistance modifier add gm4_combat_expanded:elite_buff.frost 0.45 add_value

item replace entity @s armor.head with packed_ice
data modify entity @s ArmorDropChances[3] set value -327.670F

team join gm4_ce_elite.glacial
