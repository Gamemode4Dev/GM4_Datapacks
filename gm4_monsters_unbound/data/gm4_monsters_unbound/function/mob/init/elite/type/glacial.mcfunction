# pick this elite type to spawn
# @s = zombie / skeleton types
# at @s
# run from mob/init/elite/pick

tag @s add gm4_mu_slowing_attack
tag @s add gm4_mu_elite.glacial

attribute @s generic.max_health modifier add gm4_monsters_unbound:elite_buff.frost 2.5 add_multiplied_total
attribute @s generic.knockback_resistance modifier add gm4_monsters_unbound:elite_buff.frost 0.45 add_value

loot replace entity @s armor.head loot gm4_monsters_unbound:elite/glacial
data modify entity @s ArmorDropChances[3] set value 1F

team join gm4_mu_elite.glacial