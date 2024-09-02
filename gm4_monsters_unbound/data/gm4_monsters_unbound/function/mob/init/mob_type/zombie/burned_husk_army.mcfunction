# spawn up to 11 extra husks
# @s = husk
# at @s
# run from mob/init/mob_type/zombie/burned_husk

execute if block ~1 ~1 ~ #gm4:no_collision run summon husk ~1 ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if block ~-1 ~1 ~ #gm4:no_collision run summon husk ~-1 ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if block ~ ~1 ~1 #gm4:no_collision run summon husk ~ ~ ~1 {Tags:["gm4_sr_extra_mob"]}
execute if block ~ ~1 ~-1 #gm4:no_collision run summon husk ~ ~ ~-1 {Tags:["gm4_sr_extra_mob"]}
execute if predicate {condition:"minecraft:random_chance",chance:0.5} if block ~1 ~1 ~1 #gm4:no_collision run summon husk ~1 ~ ~1 {Tags:["gm4_sr_extra_mob"]}
execute if predicate {condition:"minecraft:random_chance",chance:0.5} if block ~-1 ~1 ~-1 #gm4:no_collision run summon husk ~-1 ~ ~-1 {Tags:["gm4_sr_extra_mob"]}
execute if predicate {condition:"minecraft:random_chance",chance:0.5} if block ~1 ~1 ~-1 #gm4:no_collision run summon husk ~1 ~ ~-1 {Tags:["gm4_sr_extra_mob"]}
execute if predicate {condition:"minecraft:random_chance",chance:0.25} if block ~-1 ~1 ~1 #gm4:no_collision run summon husk ~-1 ~ ~1 {Tags:["gm4_sr_extra_mob"]}
execute if predicate {condition:"minecraft:random_chance",chance:0.25} if block ~2 ~1 ~-1 #gm4:no_collision run summon husk ~2 ~ ~-1 {Tags:["gm4_sr_extra_mob"]}
execute if predicate {condition:"minecraft:random_chance",chance:0.25} if block ~-1 ~1 ~2 #gm4:no_collision run summon husk ~-1 ~ ~2 {Tags:["gm4_sr_extra_mob"]}
execute if predicate {condition:"minecraft:random_chance",chance:0.25} if block ~2 ~1 ~2 #gm4:no_collision run summon husk ~2 ~ ~2 {Tags:["gm4_sr_extra_mob"]}

scoreboard players set $mob_extras gm4_sr_data 1
