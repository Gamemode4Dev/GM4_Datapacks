#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ grass_block run function potion_infusers:effects/failed
execute if block ~ ~ ~ grass_block run function potion_infusers:effects/success
execute if block ~ ~ ~ grass_block run setblock ~ ~ ~ mycelium
