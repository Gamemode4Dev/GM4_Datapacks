# make spider gargantuan
# @s = spider
# at @s
# run from mob/init/mob_type/spider/spider
# run from mob/init/mob_type/spider/underground/pick

attribute @s generic.movement_speed modifier add gm4_monsters_unbound:stat_change.snowy 0.25 add_multiplied_total
attribute @s generic.scale modifier add gm4_monsters_unbound:stat_change.snowy 0.5 add_multiplied_total
attribute @s generic.max_health modifier add gm4_monsters_unbound:stat_change.snowy 0.33 add_multiplied_total
effect give @s weaving infinite 0
team join gm4_mu_elite.gargantuan
