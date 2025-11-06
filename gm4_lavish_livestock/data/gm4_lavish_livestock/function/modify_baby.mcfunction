say found me!
effect give @s absorption infinite 0 false

scoreboard players operation @s gm4_lavish_livestock_size = $size gm4_lavish_livestock_size
execute if score @s gm4_lavish_livestock_size matches 0..1 if predicate {condition:"minecraft:random_chance",chance:1} run scoreboard players add @s gm4_lavish_livestock_size 1
execute if score @s gm4_lavish_livestock_size matches 1 run attribute @s minecraft:scale modifier add gm4_lavish_livestock:size 0.2 add_multiplied_base
execute if score @s gm4_lavish_livestock_size matches 2 run attribute @s minecraft:scale modifier add gm4_lavish_livestock:size 0.4 add_multiplied_base
