#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ dirt run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ dirt run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ dirt run setblock ~ ~ ~ grass_block
