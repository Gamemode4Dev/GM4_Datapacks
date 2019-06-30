#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ tube_coral_fan unless block ~ ~ ~ tube_coral_wall_fan run function potion_infusers:effects/failed
execute if block ~ ~ ~ tube_coral_fan run function potion_infusers:effects/success
execute if block ~ ~ ~ tube_coral_wall_fan run function potion_infusers:effects/success
execute if block ~ ~ ~ tube_coral_fan[waterlogged=true] run setblock ~ ~ ~ tube_coral[waterlogged=true]
execute if block ~ ~ ~ tube_coral_wall_fan[waterlogged=true] run setblock ~ ~ ~ tube_coral[waterlogged=true]
execute if block ~ ~ ~ tube_coral_fan[waterlogged=false] run setblock ~ ~ ~ tube_coral[waterlogged=false]
execute if block ~ ~ ~ tube_coral_wall_fan[waterlogged=false] run setblock ~ ~ ~ tube_coral[waterlogged=false]
