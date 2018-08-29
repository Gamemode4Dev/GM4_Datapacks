# kill chunk markers that have been generated and have all adjacent chunks generated
execute if block ~16 ~ ~ barrier if block ~-16 ~ ~ barrier if block ~ ~ ~16 barrier if block ~ ~ ~-16 barrier run kill @s
