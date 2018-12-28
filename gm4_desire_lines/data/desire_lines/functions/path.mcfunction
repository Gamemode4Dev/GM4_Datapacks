#@s=@a[gamemode=!creative,gamemode=!spectator]
#run by player.mcfunction

#check blocks
fill ~ ~-1 ~ ~ ~-1 ~ coarse_dirt replace dirt
fill ~ ~-1 ~ ~ ~-1 ~ dirt replace grass_block
fill ~ ~ ~ ~ ~ ~ air replace snow[layers=1]
fill ~ ~ ~ ~ ~ ~ snow[layers=1] replace snow[layers=2]
execute if block ~ ~ ~ #desire_lines:breakable run setblock ~ ~ ~ air destroy
#advancement check
execute if block ~ ~-1 ~ coarse_dirt run scoreboard players add @s gm4_dl_affcoarse 1
execute if score @s gm4_dl_affcoarse matches 1000.. run advancement grant @s only gm4:desire_lines_1000
execute if score @s gm4_dl_affcoarse matches 10000.. run advancement grant @s only gm4:desire_lines_10000
