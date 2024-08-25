# set mountain zombie stats
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie/base

execute positioned ~ ~35 ~ store result score $phantom_count gm4_mu_data if entity @e[type=phantom,distance=..32]
execute if score $phantoms gm4_mu_data matches 0 if score $nearby_home_bed gm4_mu_data matches 0 if score $phantom_count gm4_mu_data < $mob_limit.phantom gm4_mu_data if predicate gm4_monsters_unbound:chance/phantom/spawn store success score $mob_extras gm4_sr_data run summon phantom ~ ~35 ~ {Tags:["gm4_sr_extra_mob","gm4_mu_phantom"]}
attribute @s generic.attack_knockback modifier add gm4_monsters_unbound:stat_change.mountainous 1 add_value
attribute @s generic.max_health modifier add gm4_monsters_unbound:stat_change.mountainous 0.1 add_multiplied_total
