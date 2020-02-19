#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ sea_pickle run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ sea_pickle run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ sea_pickle[pickles=1] run setblock ~ ~ ~ turtle_egg[eggs=1]
execute if block ~ ~ ~ sea_pickle[pickles=2] run setblock ~ ~ ~ turtle_egg[eggs=2]
execute if block ~ ~ ~ sea_pickle[pickles=3] run setblock ~ ~ ~ turtle_egg[eggs=3]
execute if block ~ ~ ~ sea_pickle[pickles=4] run setblock ~ ~ ~ turtle_egg[eggs=4]
