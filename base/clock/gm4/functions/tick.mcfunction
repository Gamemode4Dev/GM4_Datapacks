#runs every tick
scoreboard players add currentTick gm4_clockTick 1
execute if score currentTick gm4_clockTick matches 16.. run scoreboard players set currentTick gm4_clockTick 0
function #gm4:pulse_check
function #gm4:repeat

#prints scheduled out-of-date messages to chat
execute if score currentTick gm4_clockTick matches 0 if entity @a[limit=1] if entity @e[limit=1,tag=message,type=area_effect_cloud] run tellraw @a ["",{"text":"The following modules are out of date: ","color":"aqua"},{"selector":"@e[type=area_effect_cloud,tag=message]","color":"gold","insertion":"/tellraw @p %s"}]
execute if score currentTick gm4_clockTick matches 0 if entity @a[limit=1] if entity @e[limit=1,tag=message,type=area_effect_cloud] run kill @e[type=area_effect_cloud,tag=message]
