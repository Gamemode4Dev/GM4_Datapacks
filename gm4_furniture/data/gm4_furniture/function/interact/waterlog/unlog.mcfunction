# water-unlog this part of the furniture
# @s = player holding bucket
# at furniture's interacted interaction entity
# run from interact/waterlog/check

execute if score $mainhand_bucket gm4_furniture_data matches 1 run function gm4_furniture:interact/waterlog/modify_mainhand
execute if score $mainhand_bucket gm4_furniture_data matches 0 run function gm4_furniture:interact/waterlog/modify_offhand

scoreboard players set $waterlog_completed gm4_furniture_data 0
execute store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=0,waterlogged=false] replace light[level=0,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ barrier[waterlogged=false] replace barrier[waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=15,waterlogged=false] replace light[level=15,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=14,waterlogged=false] replace light[level=14,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=13,waterlogged=false] replace light[level=13,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=12,waterlogged=false] replace light[level=12,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=11,waterlogged=false] replace light[level=11,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=10,waterlogged=false] replace light[level=10,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=9,waterlogged=false] replace light[level=9,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=8,waterlogged=false] replace light[level=8,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=7,waterlogged=false] replace light[level=7,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=6,waterlogged=false] replace light[level=6,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=5,waterlogged=false] replace light[level=5,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=4,waterlogged=false] replace light[level=4,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=3,waterlogged=false] replace light[level=3,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=2,waterlogged=false] replace light[level=2,waterlogged=true]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=1,waterlogged=false] replace light[level=1,waterlogged=true]

playsound item.bucket.fill player @a[distance=..16] ~ ~ ~ 1 1
scoreboard players set $interaction_processed gm4_furniture_data 1
