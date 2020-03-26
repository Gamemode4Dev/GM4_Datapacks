# blast furnace processes
# @s - blast furnace
# called by main

# removal
execute unless block ~ ~ ~ hopper run function gm4_blast_furnaces:destroy

# verify furnace location
execute unless block ^ ^ ^1 furnace run function gm4_blast_furnaces:find_furnace

execute if entity @s[tag=gm4_bf_has_furnace] if block ^ ^ ^1 furnace[lit=true] run function gm4_blast_furnaces:verify_furnace

# particle
execute if block ^ ^ ^1 furnace[lit=true] run particle large_smoke ^ ^.4 ^1 0 0 0 0 5 normal @a
