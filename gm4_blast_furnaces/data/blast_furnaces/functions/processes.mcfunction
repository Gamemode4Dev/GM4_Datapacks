# blast furnace processes
# @s - blast furnace
# called by main

# removal
execute unless block ~ ~ ~ hopper{CustomName:'{"translate":"%1$s%3427655$s","with":["Blast Furnace",{"translate":"block.gm4.blast_furnace"}]}'} run function blast_furnaces:destroy

# verify furnace location
execute unless block ^ ^ ^1 furnace run function blast_furnaces:find_furnace

execute if entity @s[tag=gm4_bf_has_furnace] if block ^ ^ ^1 furnace[lit=true] run function blast_furnaces:verify_furnace

# particle
execute if block ^ ^ ^1 furnace[lit=true] run particle large_smoke ^ ^.4 ^1 0 0 0 0 5 normal @a
