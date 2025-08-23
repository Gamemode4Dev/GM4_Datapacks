# make this creeper stronger
# @s = creeper
# at @s
# run from mob/init/mob_type/creeper/base

attribute @s minecraft:knockback_resistance modifier add gm4_monsters_unbound:stat_change.gargantuan 0.4 add_value
attribute @s minecraft:max_health modifier add gm4_monsters_unbound:stat_change.gargantuan 0.25 add_multiplied_total
