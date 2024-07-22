
tag @s add gm4_ce_elite
tag @s add gm4_ce_elite.vorpal
tag @s add gm4_ce_elite.on_hit

tag @s add gm4_ce_elite.on_death
summon marker ~ ~ ~ {Tags:["gm4_ce_elite_death_marker","gm4_ce_elite.vorpal"]}
ride @e[type=marker,tag=gm4_ce_elite_death_marker,limit=1,sort=nearest] mount @s

attribute @s generic.max_health modifier add gm4_combat_expanded:elite_buff.vorpal 2.5 add_multiplied_total

item replace entity @s armor.head with black_wool
data modify entity @s ArmorDropChances[3] set value -327.670F

team join gm4_ce_elite.vorpal
