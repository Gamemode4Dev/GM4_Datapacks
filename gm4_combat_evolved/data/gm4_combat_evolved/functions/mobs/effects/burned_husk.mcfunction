# spawn up to 11 extra husks
# @s = husk
# at @s
# run from mobs/husk

execute if entity @s[tag=!gm4_ce_extra_mob] if block ~1 ~1 ~ #gm4:no_collision run summon husk ~1 ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if entity @s[tag=!gm4_ce_extra_mob] if block ~-1 ~1 ~ #gm4:no_collision run summon husk ~-1 ~ ~ {Tags:["gm4_ce_extra_mob"]}
execute if entity @s[tag=!gm4_ce_extra_mob] if block ~ ~1 ~1 #gm4:no_collision run summon husk ~ ~ ~1 {Tags:["gm4_ce_extra_mob"]}
execute if entity @s[tag=!gm4_ce_extra_mob] if block ~ ~1 ~-1 #gm4:no_collision run summon husk ~ ~ ~-1 {Tags:["gm4_ce_extra_mob"]}
execute if entity @s[tag=!gm4_ce_extra_mob] if block ~1 ~1 ~1 #gm4:no_collision run summon husk ~1 ~ ~1 {Tags:["gm4_ce_extra_mob"]}
execute if entity @s[tag=!gm4_ce_extra_mob] if block ~-1 ~1 ~-1 #gm4:no_collision run summon husk ~-1 ~ ~-1 {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_evolved:technical/chance_50 if block ~1 ~1 ~-1 #gm4:no_collision run summon husk ~1 ~ ~-1 {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_evolved:technical/chance_50 if block ~-1 ~1 ~1 #gm4:no_collision run summon husk ~-1 ~ ~1 {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_evolved:technical/chance_50 if block ~2 ~1 ~-1 #gm4:no_collision run summon husk ~2 ~ ~-1 {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_evolved:technical/chance_50 if block ~-1 ~1 ~2 #gm4:no_collision run summon husk ~-1 ~ ~2 {Tags:["gm4_ce_extra_mob"]}
execute if predicate gm4_combat_evolved:technical/chance_50 if block ~2 ~1 ~2 #gm4:no_collision run summon husk ~2 ~ ~2 {Tags:["gm4_ce_extra_mob"]}
scoreboard players set $mob_extras gm4_ce_data 1
