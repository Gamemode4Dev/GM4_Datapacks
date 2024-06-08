# apply burned husk effects
# @s = husk
# at @s
# run from mob/init/mob_type/zombie

attribute @s generic.max_health modifier add 34931bf4-2d02-4700-bb16-097bc669d313 "gm4_ce_modifier_burned" -0.65 add_multiplied_base
attribute @s generic.attack_damage modifier add 96ee68f2-4150-4350-af04-e4230fcd2cec "gm4_ce_modifier_burned" -0.25 add_multiplied_base
execute at @p[gamemode=!spectator] store result score $husk_count gm4_ce_data if entity @e[type=husk,distance=..128]
execute if entity @s[tag=!gm4_ce_extra_mob] unless score $husk_count gm4_ce_data > $mob_limit.husk_army gm4_ce_data run function gm4_combat_expanded:mob/init/modifier/special/burned_husk_army
