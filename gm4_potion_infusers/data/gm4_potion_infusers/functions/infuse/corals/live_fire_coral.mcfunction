#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ dead_fire_coral run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ dead_fire_coral run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ dead_fire_coral[waterlogged=true] run setblock ~ ~ ~ fire_coral[waterlogged=true]
execute if block ~ ~ ~ dead_fire_coral[waterlogged=false] run setblock ~ ~ ~ fire_coral[waterlogged=false]
