#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ potatoes run function potion_infusers:effects/failed
execute if block ~ ~ ~ potatoes run function potion_infusers:effects/success
execute if block ~ ~ ~ potatoes run setblock ~ ~ ~ potatoes[age=7]
