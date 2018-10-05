# Here is where all the main functions reside in

function blast_furnaces:required/setup-furnace-output
function blast_furnaces:required/furnace-output-break
function blast_furnaces:required/handle-block-structure
function blast_furnaces:required/handle-smelting

# add utility scoreboards
scoreboard objectives add gm4_bf_placed minecraft.used:minecraft.iron_block
scoreboard objectives add gm4_bf_placedg minecraft.used:minecraft.glass
scoreboard objectives add gm4_bf_placedf minecraft.used:minecraft.furnace