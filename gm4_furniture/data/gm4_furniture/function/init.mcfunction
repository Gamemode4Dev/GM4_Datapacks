execute unless score furniture gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Furniture"}
execute unless score furniture gm4_earliest_version < furniture gm4_modules run scoreboard players operation furniture gm4_earliest_version = furniture gm4_modules
scoreboard players set furniture gm4_modules 1

scoreboard objectives add gm4_furniture_data dummy
scoreboard objectives add gm4_furniture_last_hit dummy
scoreboard objectives add gm4_furniture_id dummy
scoreboard objectives add gm4_furniture_index dummy
scoreboard objectives add gm4_furniture_craft_sound_time dummy
scoreboard objectives add gm4_furniture_sit_height dummy
scoreboard objectives add gm4_furniture_relog custom:leave_game

scoreboard players set #2 gm4_furniture_data 2
scoreboard players set #16 gm4_furniture_data 16
scoreboard players set #256 gm4_furniture_data 256
scoreboard players set #65536 gm4_furniture_data 65536

team add gm4_furniture_nocol
team modify gm4_furniture_nocol collisionRule never

# build furniture station trade data
data modify storage gm4_furniture:data furniture_station set value []
function gm4_furniture:generate_trades
execute store result score $max_index gm4_furniture_index run data get storage gm4_furniture:data furniture_station
scoreboard players remove $max_index gm4_furniture_index 1

schedule function gm4_furniture:main 1t
schedule function gm4_furniture:slow_clock 1t

#$moduleUpdateList
