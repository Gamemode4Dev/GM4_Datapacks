# converts the block the player is stepping on
# @s = survival player who initiated a desire lines block conversion
# at @s
# run from player

# check blocks
fill ~ ~-0.06 ~ ~ ~-0.06 ~ coarse_dirt replace dirt
fill ~ ~-0.06 ~ ~ ~-0.06 ~ dirt replace grass_block
fill ~ ~ ~ ~ ~ ~ air replace snow[layers=1]
fill ~ ~ ~ ~ ~ ~ snow[layers=1] replace snow[layers=2]

# remove foliage
execute if block ~ ~ ~ #gm4:foliage unless block ~ ~ ~ moss_carpet run setblock ~ ~ ~ air destroy

# advancement check
execute if block ~ ~-0.07 ~ coarse_dirt run scoreboard players add @s gm4_dl_affcoarse 1
advancement grant @s[scores={gm4_dl_affcoarse=8000}] only gm4:desire_lines_8000
advancement grant @s[scores={gm4_dl_affcoarse=10000}] only gm4:desire_lines_10000
