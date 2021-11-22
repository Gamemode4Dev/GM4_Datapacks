# run from load and mark_dimension

forceload remove 29999999 7134
forceload add 29999999 7134

fill 29999998 0 7135 29999997 2 7130 minecraft:bedrock
setblock 29999998 1 7134 minecraft:yellow_shulker_box
setblock 29999998 1 7133 minecraft:birch_wall_sign[facing=north]
setblock 29999998 1 7132 minecraft:jukebox{RecordItem:{id:"minecraft:stick",Count:1,tag:{}}}
