#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ cobblestone run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ cobblestone run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ cobblestone run setblock ~ ~ ~ gravel
