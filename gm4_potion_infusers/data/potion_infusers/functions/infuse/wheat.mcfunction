#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ wheat run function potion_infusers:effects/failed
execute if block ~ ~ ~ wheat run function potion_infusers:effects/success
execute if block ~ ~ ~ wheat run setblock ~ ~ ~ wheat[age=7]
