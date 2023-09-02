
item replace entity @p[tag=gm4_furniture_target,gamemode=!creative] weapon.mainhand with bucket
fill ~ ~ ~ ~ ~ ~ light[level=0,waterlogged=true] replace light[level=0]
fill ~ ~ ~ ~ ~ ~ light[level=15,waterlogged=true] replace light[level=15]
fill ~ ~ ~ ~ ~ ~ barrier[waterlogged=true] replace barrier
playsound item.bucket.empty player @a[distance=..16] ~ ~ ~ 1 1
scoreboard players set $interaction_processed gm4_furniture_data 1
