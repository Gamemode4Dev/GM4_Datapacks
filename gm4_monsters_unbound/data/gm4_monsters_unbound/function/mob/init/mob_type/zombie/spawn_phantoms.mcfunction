# spawn phantoms
# @s = zombie / skeleton
# at @s
# run from mob/init/mob_type/zombie/base
# run from mob/init/mob_type/skeleton/base

execute if block ~ ~35 ~ #gm4:no_collision store success score $mob_extras gm4_sr_data run summon phantom ~ ~35 ~ {Tags:["gm4_sr_extra_mob","gm4_mu_phantom"]}
execute if block ~2 ~35 ~ #gm4:no_collision store success score $mob_extras gm4_sr_data run summon phantom ~2 ~35 ~ {Tags:["gm4_sr_extra_mob","gm4_mu_phantom"]}
execute if block ~-1 ~35 ~2 #gm4:no_collision store success score $mob_extras gm4_sr_data run summon phantom ~-1 ~35 ~2 {Tags:["gm4_sr_extra_mob","gm4_mu_phantom"]}
execute if predicate {condition:"random_chance",chance:0.5} if block ~-2 ~35 ~-1 #gm4:no_collision store success score $mob_extras gm4_sr_data run summon phantom ~-2 ~35 ~-1 {Tags:["gm4_sr_extra_mob","gm4_mu_phantom"]}
execute if predicate {condition:"random_chance",chance:0.5} if block ~2 ~35 ~-2 #gm4:no_collision store success score $mob_extras gm4_sr_data run summon phantom ~2 ~35 ~-2 {Tags:["gm4_sr_extra_mob","gm4_mu_phantom"]}
execute if predicate {condition:"random_chance",chance:0.5} if block ~-2 ~35 ~2 #gm4:no_collision store success score $mob_extras gm4_sr_data run summon phantom ~-2 ~35 ~2 {Tags:["gm4_sr_extra_mob","gm4_mu_phantom"]}
