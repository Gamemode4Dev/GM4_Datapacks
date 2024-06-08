# calculate modifiers for newly spawned enderman
# @s = enderman
# at @s
# run from mob/init/difficulty/check_type

# the end
attribute @s[predicate=gm4_ce_base:mob/modifier/the_end] generic.attack_damage modifier add 0872b8ed-f482-4a29-94dc-22df9a28dddb "gm4_ce_modifier_end" 0.2 add_multiplied_base
attribute @s[predicate=gm4_ce_base:mob/modifier/the_end] generic.movement_speed modifier add 17004032-9186-4202-b662-14841061fbb2 "gm4_ce_modifier_end" 0.15 add_multiplied_base
