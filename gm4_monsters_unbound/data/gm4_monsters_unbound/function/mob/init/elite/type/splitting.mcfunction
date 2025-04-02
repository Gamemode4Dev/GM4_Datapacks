# pick this elite type to spawn
# @s = zombie / skeleton types
# at @s
# run from mob/init/elite/pick

tag @s add gm4_mu_elite.process
tag @s add gm4_mu_elite.splitting

attribute @s minecraft:max_health modifier add gm4_monsters_unbound:elite_buff.vorpal 2.5 add_multiplied_total

loot replace entity @s[type=!#gm4_survival_refightalized:skeleton_types] armor.head loot gm4_monsters_unbound:elite/splitting_zombie
loot replace entity @s[type=#gm4_survival_refightalized:skeleton_types] armor.head loot gm4_monsters_unbound:elite/splitting_skeleton
data modify entity @s ArmorDropChances[3] set value 1F

team join gm4_mu_elite.splitting
