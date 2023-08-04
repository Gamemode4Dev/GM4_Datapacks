# places a ladder when the scan finds a valid location (in water)
# @s = player that interacts with a "right click detection" villager while holding ladder
# at location of valid spot for ladder placement (in water)
# run from function: gm4_rope_ladders:mechanics/ladder_placement/place_ladder

# place water ladder
execute if block ~ ~1 ~ ladder[facing=south] run setblock ~ ~ ~ ladder[facing=south,waterlogged=true]
execute if block ~ ~1 ~ ladder[facing=north] run setblock ~ ~ ~ ladder[facing=north,waterlogged=true]
execute if block ~ ~1 ~ ladder[facing=east] run setblock ~ ~ ~ ladder[facing=east,waterlogged=true]
execute if block ~ ~1 ~ ladder[facing=west] run setblock ~ ~ ~ ladder[facing=west,waterlogged=true]
