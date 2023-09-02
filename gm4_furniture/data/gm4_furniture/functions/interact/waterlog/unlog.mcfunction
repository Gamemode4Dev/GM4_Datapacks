
item replace entity @p[tag=gm4_furniture_target,gamemode=!creative] weapon.mainhand with water_bucket
fill ~ ~ ~ ~ ~ ~ light[level=0,waterlogged=false] replace light[level=0,waterlogged=true]
fill ~ ~ ~ ~ ~ ~ light[level=15,waterlogged=false] replace light[level=15,waterlogged=true]
fill ~ ~ ~ ~ ~ ~ barrier[waterlogged=false] replace barrier[waterlogged=true]
playsound item.bucket.fill player @a[distance=..16] ~ ~ ~ 1 1
scoreboard players set $interaction_processed gm4_furniture_data 1
