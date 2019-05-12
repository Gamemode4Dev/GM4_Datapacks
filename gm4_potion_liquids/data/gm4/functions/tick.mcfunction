#runs every tick
scoreboard players add current_tick gm4_clock_tick 1
execute if score current_tick gm4_clock_tick matches 16.. run scoreboard players set current_tick gm4_clock_tick 0
function #gm4:pulse_check

#prints scheduled out-of-date messages to chat
execute if score current_tick gm4_clock_tick matches 0 if entity @e[limit=1,tag=gm4_update_message,type=area_effect_cloud] if entity @a[limit=1] run function gm4:out_of_date
