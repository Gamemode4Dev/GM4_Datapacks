# pick this elite type to spawn
# @s = zombie / skeleton types
# at @s
# run from mob/init/elite/pick

tag @s add gm4_mu_elite.vorpal
tag @s add gm4_mu_elite.on_hit

attribute @s minecraft:max_health modifier add gm4_monsters_unbound:elite_buff.vorpal 2.5 add_multiplied_total
attribute @s minecraft:attack_damage modifier add gm4_monsters_unbound:elite_buff.vorpal 0.25 add_multiplied_total

loot replace entity @s armor.head loot gm4_monsters_unbound:elite/vorpal
data modify entity @s ArmorDropChances[3] set value 1F

scoreboard players add @s gm4_sr_arrow.damage_change 5

team join gm4_mu_elite.vorpal
