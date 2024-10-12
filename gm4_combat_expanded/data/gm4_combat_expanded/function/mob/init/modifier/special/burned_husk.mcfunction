# apply burned husk effects
# @s = husk
# at @s
# run from mob/init/mob_type/zombie

attribute @s minecraft:max_health modifier add gm4_combat_expanded:stat_change.burned_husk -0.65 add_multiplied_base
attribute @s minecraft:attack_damage modifier add gm4_combat_expanded:stat_change.burned_husk -0.25 add_multiplied_base
execute at @p[gamemode=!spectator] store result score $husk_count gm4_ce_data if entity @e[type=husk,distance=..128]
execute if entity @s[tag=!gm4_ce_extra_mob] unless score $husk_count gm4_ce_data > $mob_limit.husk_army gm4_ce_data run function gm4_combat_expanded:mob/init/modifier/special/burned_husk_army
