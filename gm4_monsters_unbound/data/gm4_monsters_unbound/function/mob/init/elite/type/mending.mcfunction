# pick this elite type to spawn
# @s = zombie / skeleton types
# at @s
# run from mob/init/elite/pick

tag @s add gm4_mu_elite.process
tag @s add gm4_mu_elite.mending

attribute @s minecraft:max_health modifier add gm4_monsters_unbound:elite_buff.heal 1.5 add_multiplied_total
attribute @s minecraft:movement_speed modifier add gm4_monsters_unbound:elite_buff.heal -0.25 add_multiplied_total

loot replace entity @s armor.head loot gm4_monsters_unbound:elite/mending
data modify entity @s drop_chances.head set value 0

team join gm4_mu_elite.mending
