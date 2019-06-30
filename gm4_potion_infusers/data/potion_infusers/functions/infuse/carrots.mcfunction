#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ carrots run function potion_infusers:effects/failed
execute if block ~ ~ ~ carrots run function potion_infusers:effects/success
execute if block ~ ~ ~ carrots run setblock ~ ~ ~ carrots[age=7]
