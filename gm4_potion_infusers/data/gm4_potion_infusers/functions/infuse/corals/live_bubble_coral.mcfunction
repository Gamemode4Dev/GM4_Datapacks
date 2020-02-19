#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ dead_bubble_coral run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ dead_bubble_coral run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ dead_bubble_coral[waterlogged=true] run setblock ~ ~ ~ bubble_coral[waterlogged=true]
execute if block ~ ~ ~ dead_bubble_coral[waterlogged=false] run setblock ~ ~ ~ bubble_coral[waterlogged=false]
