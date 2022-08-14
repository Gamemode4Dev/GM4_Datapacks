# lib_forceload
lib_forceload is a mcfunction library that forceloads a specific chunk to be used for location-dependent functions.

## Installation
This library assumes that the overworld dimension (`minecraft:overworld`) exists and that for every dimension, Y=0-2 is a valid location for blocks to be placed. If there are datapacks installed without these conditions, lib_forceload may not work.

## How to Use
When a dimension is first loaded by a player, the chunk at position `29999999 7134` is forceloaded. 

### Forceloaded Blocks
In this chunk, there are 3 blocks which may be useful:
- yellow shulker box at `29999998 1 7134`
- birch wall sign (facing north) at `29999998 1 7133`
- jukebox at `29999998 1 7132`

### Marking Dimensions
In every dimension, there is a marker entity located at `29999999 0 7135` which has the CustomName of the dimension, and the tag `gm4_dimension`. Each marker has a score `gm4_dimension` specific to the dimension. This means all dimensions have a unique id which can be used for dimension-specific functions.

### Command Block Tick
In the overworld there is a repeating command block which runs the function tag `#gm4_forceload:command_block_tick`. This function tag can be used to call functions at the command block subtick instead of the function subtick.
