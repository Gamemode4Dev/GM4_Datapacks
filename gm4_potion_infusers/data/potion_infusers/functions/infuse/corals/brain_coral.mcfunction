#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ brain_coral_fan unless block ~ ~ ~ brain_coral_wall_fan run function potion_infusers:effects/failed
execute if block ~ ~ ~ brain_coral_fan run function potion_infusers:effects/success
execute if block ~ ~ ~ brain_coral_wall_fan run function potion_infusers:effects/success
execute if block ~ ~ ~ brain_coral_fan[waterlogged=true] run setblock ~ ~ ~ brain_coral[waterlogged=true]
execute if block ~ ~ ~ brain_coral_wall_fan[waterlogged=true] run setblock ~ ~ ~ brain_coral[waterlogged=true]
execute if block ~ ~ ~ brain_coral_fan[waterlogged=false] run setblock ~ ~ ~ brain_coral[waterlogged=false]
execute if block ~ ~ ~ brain_coral_wall_fan[waterlogged=false] run setblock ~ ~ ~ brain_coral[waterlogged=false]
