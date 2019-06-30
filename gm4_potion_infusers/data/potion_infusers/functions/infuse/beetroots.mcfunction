#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ beetroots run function potion_infusers:effects/failed
execute if block ~ ~ ~ beetroots run function potion_infusers:effects/success
execute if block ~ ~ ~ beetroots run setblock ~ ~ ~ beetroots[age=3]
