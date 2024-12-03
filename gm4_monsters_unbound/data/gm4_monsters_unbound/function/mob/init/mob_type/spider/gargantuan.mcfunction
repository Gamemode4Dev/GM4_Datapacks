# make spider gargantuan
# @s = spider
# at @s
# run from mob/init/mob_type/spider/spider
# run from mob/init/mob_type/spider/underground/pick

attribute @s movement_speed modifier add gm4_monsters_unbound:stat_change.gargantuan 0.25 add_multiplied_total
attribute @s scale modifier add gm4_monsters_unbound:stat_change.gargantuan 0.25 add_multiplied_total
attribute @s max_health modifier add gm4_monsters_unbound:stat_change.gargantuan 0.75 add_multiplied_total
effect give @s weaving infinite 0
team join gm4_mu_elite.gargantuan
tag @s add gm4_mu_elite
tag @s add gm4_mu_elite.gargantuan
