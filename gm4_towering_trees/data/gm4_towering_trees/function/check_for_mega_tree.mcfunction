# check what orientation this big tree has (if it is a big tree)
# @s = sapling marker
# located at @s
# run from generate_tree

# SE = 1
execute if blocks ~1 ~ ~ ~1 ~ ~ ~ ~ ~ all if blocks ~1 ~ ~1 ~1 ~ ~1 ~ ~ ~ all if blocks ~ ~ ~1 ~ ~ ~1 ~ ~ ~ all run return 1
# NE = 2
execute if blocks ~1 ~ ~ ~1 ~ ~ ~ ~ ~ all if blocks ~1 ~ ~-1 ~1 ~ ~-1 ~ ~ ~ all if blocks ~ ~ ~-1 ~ ~ ~-1 ~ ~ ~ all run return 2
# SW = 3
execute if blocks ~-1 ~ ~ ~-1 ~ ~ ~ ~ ~ all if blocks ~-1 ~ ~1 ~-1 ~ ~1 ~ ~ ~ all if blocks ~ ~ ~1 ~ ~ ~1 ~ ~ ~ all run return 3
# NW = 4
execute if blocks ~-1 ~ ~ ~-1 ~ ~ ~ ~ ~ all if blocks ~-1 ~ ~-1 ~-1 ~ ~-1 ~ ~ ~ all if blocks ~ ~ ~-1 ~ ~ ~-1 ~ ~ ~ all run return 4

return 0
