# if the block below the structure marker is spawnable, attempt to spawn a tower
execute if block ~ ~-1 ~ #orbis:structure/spawnable run function orbis:structure/tower/spawn
