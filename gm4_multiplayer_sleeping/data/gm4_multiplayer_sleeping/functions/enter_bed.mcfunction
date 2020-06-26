#Player Count
tag @s add gm4_in_bed
function gm4_multiplayer_sleeping:player_count

tellraw @a ["",{"selector":"@s"},{"text":" is now sleeping (","color":"gray"},{"score":{"name":"value_sleepers","objective":"gm4_sleep_count"}},{"text":"/","color":"gray"},{"score":{"name":"value_required","objective":"gm4_sleep_count"}},{"text":") ","color":"gray"},{"text":"[Cancel]","color":"red","clickEvent":{"action":"run_command","value":"/trigger gm4_sleep_kick set 1"},"hoverEvent":{"action":"show_text","value":["",{"text":"Kick ","color":"white"},{"selector":"@a[tag=gm4_in_bed]"},{"text":" from their beds","color":"white"}]}}]

#Sleeping players vs required check
execute if score value_sleepers gm4_sleep_count >= value_required gm4_sleep_count run schedule function gm4_multiplayer_sleeping:pass_time 100t