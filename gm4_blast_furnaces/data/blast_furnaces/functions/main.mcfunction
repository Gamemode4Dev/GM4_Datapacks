# Here is where all the main functions reside in


execute as @e[tag=gm4_bf_output] at @s run function blast_furnaces:update
function blast_furnaces:required/furnace-output-break

scoreboard players reset @a[scores={gm4_bf_placed_iron=1..}] gm4_bf_placed_iron
scoreboard players reset @a[scores={gm4_bf_placed_furn=1..}] gm4_bf_placed_furn
