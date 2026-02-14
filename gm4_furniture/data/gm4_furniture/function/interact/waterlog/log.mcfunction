# waterlog this part of the furniture
# @s = player holding bucket
# at furniture's interacted interaction entity
# run from interact/waterlog/check

execute if score $mainhand_bucket gm4_furniture_data matches 1 run item replace entity @s[gamemode=!creative] weapon.mainhand with bucket
execute if score $mainhand_bucket gm4_furniture_data matches 0 run item replace entity @s[gamemode=!creative] weapon.offhand with bucket

scoreboard players set $waterlog_completed gm4_furniture_data 0
execute store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=0,waterlogged=true] replace light[level=0]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ barrier[waterlogged=true] replace barrier
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=15,waterlogged=true] replace light[level=15]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=14,waterlogged=true] replace light[level=14]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=13,waterlogged=true] replace light[level=13]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=12,waterlogged=true] replace light[level=12]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=11,waterlogged=true] replace light[level=11]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=10,waterlogged=true] replace light[level=10]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=9,waterlogged=true] replace light[level=9]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=8,waterlogged=true] replace light[level=8]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=7,waterlogged=true] replace light[level=7]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=6,waterlogged=true] replace light[level=6]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=5,waterlogged=true] replace light[level=5]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=4,waterlogged=true] replace light[level=4]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=3,waterlogged=true] replace light[level=3]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=2,waterlogged=true] replace light[level=2]
execute if score $waterlog_completed gm4_furniture_data matches 0 store success score $waterlog_completed gm4_furniture_data run fill ~ ~ ~ ~ ~ ~ light[level=1,waterlogged=true] replace light[level=1]

playsound item.bucket.empty player @a[distance=..16] ~ ~ ~ 1 1
scoreboard players set $interaction_processed gm4_furniture_data 1
