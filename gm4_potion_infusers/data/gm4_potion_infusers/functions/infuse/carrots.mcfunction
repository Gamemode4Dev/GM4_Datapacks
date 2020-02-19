#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ carrots run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ carrots run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ carrots run setblock ~ ~ ~ carrots[age=7]
