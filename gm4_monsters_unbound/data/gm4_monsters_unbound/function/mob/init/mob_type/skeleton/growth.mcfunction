# apply growth effects to skeleton
# @s = skeleton
# at @s
# run from mob/init/mob_type/skeleton/base

item replace entity @s weapon.mainhand with air
attribute @s max_health modifier add gm4_monsters_unbound:stat_change.growth 4 add_value
attribute @s movement_speed modifier add gm4_monsters_unbound:stat_change.growth 0.25 add_multiplied_base
