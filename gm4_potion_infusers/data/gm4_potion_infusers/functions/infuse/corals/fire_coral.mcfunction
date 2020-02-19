#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ fire_coral_fan unless block ~ ~ ~ fire_coral_wall_fan run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ fire_coral_fan run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ fire_coral_wall_fan run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ fire_coral_fan[waterlogged=true] run setblock ~ ~ ~ fire_coral[waterlogged=true]
execute if block ~ ~ ~ fire_coral_wall_fan[waterlogged=true] run setblock ~ ~ ~ fire_coral[waterlogged=true]
execute if block ~ ~ ~ fire_coral_fan[waterlogged=false] run setblock ~ ~ ~ fire_coral[waterlogged=false]
execute if block ~ ~ ~ fire_coral_wall_fan[waterlogged=false] run setblock ~ ~ ~ fire_coral[waterlogged=false]
