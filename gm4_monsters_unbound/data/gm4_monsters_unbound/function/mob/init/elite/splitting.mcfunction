
tag @s add gm4_mu_elite
tag @s add gm4_mu_elite.splitting

tag @s add gm4_mu_elite.on_death
execute if entity @s[type=!#gm4_survival_refightalized:skeleton_types] run summon marker ~ ~ ~ {CustomName:'{"text":"GM4 CE death marker - splitting"}',Tags:["gm4_mu_elite_death_marker","gm4_mu_elite.splitting","gm4_mu_elite.splitting_zombie"]}
execute if entity @s[type=#gm4_survival_refightalized:skeleton_types] run summon marker ~ ~ ~ {CustomName:'{"text":"GM4 CE death marker - splitting"}',Tags:["gm4_mu_elite_death_marker","gm4_mu_elite.splitting","gm4_mu_elite.splitting_skeleton"]}
ride @e[type=marker,tag=gm4_mu_elite_death_marker,limit=1,sort=nearest] mount @s

attribute @s generic.max_health modifier add gm4_monsters_unbound:elite_buff.vorpal 2.5 add_multiplied_total

item replace entity @s armor.head with spawner
data modify entity @s ArmorDropChances[3] set value -327.670F

team join gm4_mu_elite.splitting
