# set snowy zombie stats
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie/base

attribute @s minecraft:movement_speed modifier add gm4_monsters_unbound:stat_change.snowy -0.15 add_multiplied_total
attribute @s minecraft:max_health modifier add gm4_monsters_unbound:stat_change.snowy 0.2 add_multiplied_total

execute if predicate {condition:"minecraft:random_chance",chance:0.05} run function gm4_monsters_unbound:mob/init/mob_type/zombie/equip_shield
