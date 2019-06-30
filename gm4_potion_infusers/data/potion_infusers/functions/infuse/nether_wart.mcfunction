#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ nether_wart run function potion_infusers:effects/failed
execute if block ~ ~ ~ nether_wart run function potion_infusers:effects/success
execute if block ~ ~ ~ nether_wart run setblock ~ ~ ~ nether_wart[age=3]
