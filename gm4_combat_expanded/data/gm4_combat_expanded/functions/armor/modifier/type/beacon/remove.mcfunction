# remove beacon that is no longer linked to a player
# @s = beacon block_display
# at @s
# run from tick

# remove light block
execute at @s run fill ~ ~-1 ~ ~ ~-1 ~ air replace light[waterlogged=false,level=14]
execute at @s run fill ~ ~-1 ~ ~ ~-1 ~ water replace light[waterlogged=true,level=9]

# remove entities
execute on passengers run kill @s
kill @s
