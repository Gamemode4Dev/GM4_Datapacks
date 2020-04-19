#@s = player with enderpuff in inventory
#run from main

#levitation
tag @s[predicate=gm4_end_fishing:enderpuff_equipped] add gm4_enderpuff_equipped

execute as @s[tag=!gm4_enderpuff_equipped] at @s run function gm4_end_fishing:enderpuff/clear_levitation
execute as @s[tag=gm4_enderpuff_equipped,predicate=!gm4_end_fishing:has_levitation_effect] at @s run function gm4_end_fishing:enderpuff/clear_levitation

execute if entity @s[tag=gm4_enderpuff_equipped,tag=!gm4_enderpuff_fall] at @s run function gm4_end_fishing:enderpuff/apply_levitation

tag @s[tag=gm4_enderpuff_equipped] add gm4_enderpuff_fall
execute at @s[tag=gm4_enderpuff_fall] unless block ~ ~-1 ~ #gm4_end_fishing:traversable run tag @s remove gm4_enderpuff_fall

tag @s remove gm4_enderpuff_equipped

#slow falling
execute unless entity @s[scores={gm4_ef_sneak=1..}] at @s if block ~ ~-1 ~ #gm4_end_fishing:traversable if block ~ ~-2 ~ #gm4_end_fishing:traversable if block ~ ~-3 ~ #gm4_end_fishing:traversable run effect give @s slow_falling 2 0
