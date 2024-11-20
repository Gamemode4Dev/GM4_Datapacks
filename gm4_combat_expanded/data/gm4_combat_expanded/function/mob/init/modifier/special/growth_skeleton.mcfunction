# apply growth effects to skeleton
# @s = skeleton
# at @s
# run from mob/init/mob_type/skeleton

item replace entity @s weapon.mainhand with air
attribute @s minecraft:max_health modifier add gm4_combat_expanded:stat_change.growth -0.25 add_multiplied_base
attribute @s minecraft:movement_speed modifier add gm4_combat_expanded:stat_change.growth 0.24 add_multiplied_base
