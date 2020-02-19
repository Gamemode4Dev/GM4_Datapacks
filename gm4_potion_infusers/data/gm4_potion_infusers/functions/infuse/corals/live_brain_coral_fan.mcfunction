#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ dead_brain_coral_fan run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ dead_brain_coral_fan run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ dead_brain_coral_fan[waterlogged=true] run setblock ~ ~ ~ brain_coral_fan[waterlogged=true]
execute if block ~ ~ ~ dead_brain_coral_fan[waterlogged=false] run setblock ~ ~ ~ brain_coral_fan[waterlogged=false]
