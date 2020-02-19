#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ poppy run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ poppy run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ poppy run setblock ~ ~ ~ wither_rose
