
tag @s add gm4_mu_elite
tag @s add gm4_mu_slowing_attack
tag @s add gm4_mu_elite.glacial

tag @s add gm4_mu_elite.on_death
summon marker ~ ~ ~ {CustomName:'{"text":"GM4 CE death marker - glacial"}',Tags:["gm4_mu_elite_death_marker","gm4_mu_elite.glacial"]}
ride @e[type=marker,tag=gm4_mu_elite_death_marker,limit=1,sort=nearest] mount @s

attribute @s generic.max_health modifier add gm4_monsters_unbound:elite_buff.frost 2.5 add_multiplied_total
attribute @s generic.knockback_resistance modifier add gm4_monsters_unbound:elite_buff.frost 0.45 add_value

item replace entity @s armor.head with packed_ice
data modify entity @s ArmorDropChances[3] set value -327.670F

team join gm4_mu_elite.glacial
