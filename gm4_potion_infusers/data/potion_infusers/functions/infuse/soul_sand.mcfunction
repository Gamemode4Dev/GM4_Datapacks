#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ sand run function potion_infusers:effects/failed
execute if block ~ ~ ~ sand run function potion_infusers:effects/success
execute if block ~ ~ ~ sand run setblock ~ ~ ~ soul_sand
