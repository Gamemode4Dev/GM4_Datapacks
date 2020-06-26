tag @s remove gm4_in_bed
function gm4_multiplayer_sleeping:player_count



tellraw @a[tag=gm4_in_bed] ["",{"selector":"@s"},{"text":" is no longer sleeping (","color":"gray"},{"score":{"name":"value_sleepers","objective":"gm4_sleep_count"}},{"text":"/","color":"gray"},{"score":{"name":"value_required","objective":"gm4_sleep_count"}},{"text":")","color":"gray"}]