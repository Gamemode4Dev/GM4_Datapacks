#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ dead_brain_coral run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ dead_brain_coral run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ dead_brain_coral[waterlogged=true] run setblock ~ ~ ~ brain_coral[waterlogged=true]
execute if block ~ ~ ~ dead_brain_coral[waterlogged=false] run setblock ~ ~ ~ brain_coral[waterlogged=false]
