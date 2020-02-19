#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ horn_coral_fan unless block ~ ~ ~ horn_coral_wall_fan run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ horn_coral_fan run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ horn_coral_wall_fan run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ horn_coral_fan[waterlogged=true] run setblock ~ ~ ~ horn_coral[waterlogged=true]
execute if block ~ ~ ~ horn_coral_wall_fan[waterlogged=true] run setblock ~ ~ ~ horn_coral[waterlogged=true]
execute if block ~ ~ ~ horn_coral_fan[waterlogged=false] run setblock ~ ~ ~ horn_coral[waterlogged=false]
execute if block ~ ~ ~ horn_coral_wall_fan[waterlogged=false] run setblock ~ ~ ~ horn_coral[waterlogged=false]
