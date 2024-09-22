# use this tick clock only when needed
# @s = unspecified
# at unspecified
# schedule from main
# schedule from armor/augment/type/archer/activate
# schedule from here

# archer
execute as @a[tag=gm4_aa_wearing_archer] run scoreboard players operation @s gm4_aa_stat.used_bow += @s gm4_aa_stat.used_crossbow
execute as @a[tag=gm4_aa_wearing_archer,scores={gm4_aa_stat.used_bow=1..}] at @s run function gm4_augmented_armor:armor/augment/type/archer/find_arrow
scoreboard players reset @a gm4_aa_stat.used_bow
scoreboard players reset @a gm4_aa_stat.used_crossbow

execute store success score $keep_tick.archer gm4_aa_keep_tick if entity @a[tag=gm4_aa_wearing_archer]
execute if score $keep_tick.archer gm4_aa_keep_tick matches 1 run schedule function gm4_augmented_armor:clocks/temp/archer 1t
