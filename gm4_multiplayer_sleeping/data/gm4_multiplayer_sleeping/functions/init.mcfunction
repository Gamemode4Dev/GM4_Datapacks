scoreboard objectives add gm4_sleep_count dummy
scoreboard objectives add gm4_sleep_total dummy
scoreboard objectives add gm4_sleep_kick trigger

scoreboard players set value_morning gm4_sleep_count 23450
scoreboard players set value_night gm4_sleep_count 12550
scoreboard players set value_percentage gm4_sleep_count 4
scoreboard players set value_minimum gm4_sleep_count 1

function gm4_multiplayer_sleeping:player_count

execute unless score multiplayer_sleeping gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Multiplayer Sleeping"}
scoreboard players set multiplayer_sleeping gm4_modules 1

schedule function gm4_multiplayer_sleeping:main 10t

#$moduleUpdateList
