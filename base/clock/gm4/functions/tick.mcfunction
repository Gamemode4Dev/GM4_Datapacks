#runs every tick
scoreboard players add current_tick gm4_clock_tick 1
execute if score current_tick gm4_clock_tick matches 16.. run scoreboard players set current_tick gm4_clock_tick 0
function #gm4:pulse_check
function #gm4:repeat

#prints scheduled out-of-date messages to chat
execute if score current_tick gm4_clock_tick matches 0 if entity @a[limit=1] if entity @e[limit=1,tag=message,type=area_effect_cloud] run tellraw @a ["",{"text":"The following modules are out of date: ","color":"aqua"},{"selector":"@e[type=area_effect_cloud,tag=message]","color":"gold","insertion":"/tellraw @p %s"}]
execute if score current_tick gm4_clock_tick matches 0 if entity @a[limit=1] if entity @e[limit=1,tag=message,type=area_effect_cloud] run kill @e[type=area_effect_cloud,tag=message]
