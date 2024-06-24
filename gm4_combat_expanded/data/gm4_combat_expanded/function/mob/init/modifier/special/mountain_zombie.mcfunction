# set mountain zombie stats
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie

execute positioned ~ ~35 ~ store result score $phantom_count gm4_ce_data if entity @e[type=phantom,distance=..32]
execute if score $phantoms gm4_ce_data matches 0 if score $nearby_home_bed gm4_ce_data matches 0 if score $phantom_count gm4_ce_data < $mob_limit.phantom gm4_ce_data if predicate gm4_combat_expanded:technical/chance/spawn_mountain_phantom store success score $mob_extras gm4_ce_data run summon phantom ~ ~35 ~ {Tags:["gm4_ce_extra_mob","gm4_ce_phantom"]}
attribute @s generic.attack_knockback modifier add gm4_combat_expanded:stat_change.mountainous 1 add_value
scoreboard players add $mob_health gm4_ce_data 6
