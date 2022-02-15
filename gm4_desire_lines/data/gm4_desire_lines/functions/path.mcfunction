#@s=@a[gamemode=!creative,gamemode=!spectator]
#run by player.mcfunction

#check blocks
fill ~ ~-1 ~ ~ ~-1 ~ coarse_dirt replace dirt
fill ~ ~-1 ~ ~ ~-1 ~ dirt replace grass_block
fill ~ ~ ~ ~ ~ ~ air replace snow[layers=1]
fill ~ ~ ~ ~ ~ ~ snow[layers=1] replace snow[layers=2]
execute if block ~ ~ ~ #gm4:foliage unless block ~ ~ ~ moss_carpet run setblock ~ ~ ~ air destroy
#advancement check
execute if block ~ ~-1 ~ coarse_dirt run scoreboard players add @s gm4_dl_affcoarse 1
advancement grant @s[scores={gm4_dl_affcoarse=8000}] only gm4:desire_lines_8000
advancement grant @s[scores={gm4_dl_affcoarse=10000}] only gm4:desire_lines_10000

# guidebook unlock page 0
execute if score gm4_guidebook load.status matches 1 run advancement grant @s only gm4_guidebook:desire_lines/page_0
