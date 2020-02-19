#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ nether_wart run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ nether_wart run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ nether_wart run setblock ~ ~ ~ nether_wart[age=3]
