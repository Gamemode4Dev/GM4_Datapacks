fill ~ ~-1 ~ ~ ~-1 ~ coarse_dirt replace dirt
fill ~ ~-1 ~ ~ ~-1 ~ dirt replace grass_block
fill ~ ~ ~ ~ ~ ~ air replace snow[layers=1]
fill ~ ~ ~ ~ ~ ~ snow[layers=1] replace snow[layers=2]
execute if block ~ ~ ~ #desire_lines:breakable run setblock ~ ~ ~ air destroy
