# apply dark effects to any mob
# @s = any mob being initialized
# at @s
# run from mob/init/stat/prep

attribute @s minecraft:max_health modifier add gm4_combat_expanded:stat_change.dark_generic 0.15 add_multiplied_base
attribute @s minecraft:armor modifier add gm4_combat_expanded:stat_change.dark_generic 0.25 add_multiplied_base
attribute @s minecraft:movement_speed modifier add gm4_combat_expanded:stat_change.dark_generic 0.05 add_multiplied_base
