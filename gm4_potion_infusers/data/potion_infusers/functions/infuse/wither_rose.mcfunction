#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ poppy run function potion_infusers:effects/failed
execute if block ~ ~ ~ poppy run function potion_infusers:effects/success
execute if block ~ ~ ~ poppy run setblock ~ ~ ~ wither_rose
