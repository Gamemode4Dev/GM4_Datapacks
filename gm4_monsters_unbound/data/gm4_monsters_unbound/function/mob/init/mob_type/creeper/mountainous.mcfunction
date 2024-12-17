# make this creeper gargantuan
# @s = creeper
# at @s
# run from mob/init/mob_type/creeper/base

attribute @s minecraft:knockback_resistance modifier add gm4_monsters_unbound:stat_change.gargantuan 0.4 add_value
attribute @s minecraft:scale modifier add gm4_monsters_unbound:stat_change.gargantuan 0.25 add_multiplied_total
attribute @s minecraft:max_health modifier add gm4_monsters_unbound:stat_change.gargantuan 0.25 add_multiplied_total

data modify entity @s ExplosionRadius set value 4s

team join gm4_mu_elite.gargantuan
tag @s add gm4_mu_elite
tag @s add gm4_mu_elite.gargantuan
