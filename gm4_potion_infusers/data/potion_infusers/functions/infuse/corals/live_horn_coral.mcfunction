#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ dead_horn_coral run function potion_infusers:effects/failed
execute if block ~ ~ ~ dead_horn_coral run function potion_infusers:effects/success
execute if block ~ ~ ~ dead_horn_coral[waterlogged=true] run setblock ~ ~ ~ horn_coral[waterlogged=true]
execute if block ~ ~ ~ dead_horn_coral[waterlogged=false] run setblock ~ ~ ~ horn_coral[waterlogged=false]
