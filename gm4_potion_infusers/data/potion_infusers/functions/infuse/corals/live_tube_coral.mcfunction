#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ dead_tube_coral run function potion_infusers:effects/failed
execute if block ~ ~ ~ dead_tube_coral run function potion_infusers:effects/success
execute if block ~ ~ ~ dead_tube_coral[waterlogged=true] run setblock ~ ~ ~ tube_coral[waterlogged=true]
execute if block ~ ~ ~ dead_tube_coral[waterlogged=false] run setblock ~ ~ ~ tube_coral[waterlogged=false]
