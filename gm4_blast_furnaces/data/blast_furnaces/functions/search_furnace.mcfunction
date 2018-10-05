execute if block ~1 ~ ~ furnace[facing=east] run function blast_furnaces:furnace_tagging/east
execute if block ~-1 ~ ~ furnace[facing=west] run function blast_furnaces:furnace_tagging/west
execute if block ~ ~ ~1 furnace[facing=south] run function blast_furnaces:furnace_tagging/south
execute if block ~ ~ ~-1 furnace[facing=north] run function blast_furnaces:furnace_tagging/north
