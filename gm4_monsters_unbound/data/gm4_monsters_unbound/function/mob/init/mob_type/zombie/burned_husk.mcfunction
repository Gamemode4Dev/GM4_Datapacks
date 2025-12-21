# apply burned husk effects
# @s = husk
# at @s
# run from mob/init/mob_type/zombie/base

attribute @s minecraft:max_health modifier add gm4_monsters_unbound:stat_change.burned_husk -0.65 add_multiplied_total
attribute @s minecraft:attack_damage modifier add gm4_monsters_unbound:stat_change.burned_husk -0.25 add_multiplied_total
execute at @p[gamemode=!spectator] store result score $husk_count gm4_mu_data if entity @e[type=husk,distance=..128]
execute if entity @s[tag=!gm4_sr_extra_mob] unless score $husk_count gm4_mu_data > $mob_limit.husk_army gm4_mu_config run function gm4_monsters_unbound:mob/init/mob_type/zombie/burned_husk_army
