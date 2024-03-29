# spawn up to 11 extra husks
# @s = husk
# at @s
# run from mob/init/modifier/special/burned_husk

execute if predicate gm4_combat_expanded:technical/chance/extra_husk_spawn/common if block ~1 ~1 ~ #gm4:no_collision run summon husk ~1 ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/extra_husk_spawn/common if block ~-1 ~1 ~ #gm4:no_collision run summon husk ~-1 ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/extra_husk_spawn/common if block ~ ~1 ~1 #gm4:no_collision run summon husk ~ ~ ~1 {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/extra_husk_spawn/common if block ~ ~1 ~-1 #gm4:no_collision run summon husk ~ ~ ~-1 {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/extra_husk_spawn/uncommon if block ~1 ~1 ~1 #gm4:no_collision run summon husk ~1 ~ ~1 {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/extra_husk_spawn/uncommon if block ~-1 ~1 ~-1 #gm4:no_collision run summon husk ~-1 ~ ~-1 {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/extra_husk_spawn/uncommon if block ~1 ~1 ~-1 #gm4:no_collision run summon husk ~1 ~ ~-1 {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/extra_husk_spawn/rare if block ~-1 ~1 ~1 #gm4:no_collision run summon husk ~-1 ~ ~1 {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/extra_husk_spawn/rare if block ~2 ~1 ~-1 #gm4:no_collision run summon husk ~2 ~ ~-1 {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/extra_husk_spawn/rare if block ~-1 ~1 ~2 #gm4:no_collision run summon husk ~-1 ~ ~2 {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_expanded:technical/chance/extra_husk_spawn/rare if block ~2 ~1 ~2 #gm4:no_collision run summon husk ~2 ~ ~2 {Tags:["gm4_ce_extra_mob"]}

scoreboard players set $mob_extras gm4_ce_data 1
