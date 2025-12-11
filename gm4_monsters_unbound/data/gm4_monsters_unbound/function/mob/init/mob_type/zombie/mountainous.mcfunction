# set mountain zombie stats
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie/base

execute positioned ~ ~35 ~ store result score $phantom_count gm4_mu_data if entity @e[type=phantom,distance=..32]
execute if score $spawn_phantoms gm4_mu_config matches 1 if score $phantom_count gm4_mu_data < $mob_limit.phantom gm4_mu_config if predicate gm4_monsters_unbound:chance/spawn_phantom run function gm4_monsters_unbound:mob/init/mob_type/zombie/spawn_phantoms
attribute @s minecraft:attack_knockback modifier add gm4_monsters_unbound:stat_change.mountainous 1 add_value
attribute @s minecraft:attack_damage modifier add gm4_monsters_unbound:stat_change.mountainous 1 add_value

execute if predicate {condition:"minecraft:random_chance",chance:0.15} run function gm4_monsters_unbound:mob/init/mob_type/zombie/equip_shield
