# calculate modifiers for newly spawned zombie / zombie villager
# @s = zombie (villager)
# at @s
# run from mob/init/difficulty/check_type

# spawn phantoms in mountains
execute if predicate gm4_ce_base:mob/modifier/mountainous positioned ~ ~35 ~ store result score $phantom_count gm4_ce_data if entity @e[type=phantom,distance=..32]
execute if score $phantoms gm4_ce_data matches 0 if score $nearby_home_bed gm4_ce_data matches 0 if score $phantom_count gm4_ce_data < $mob_limit.phantom gm4_ce_data if predicate gm4_ce_base:technical/chance/spawn_mountain_phantom store success score $mob_extras gm4_ce_data run summon phantom ~ ~35 ~ {Tags:["gm4_ce_extra_mob","gm4_ce_phantom"]}
