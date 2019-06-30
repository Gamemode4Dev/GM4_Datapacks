#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ horn_coral run function potion_infusers:effects/failed
execute if block ~ ~ ~ horn_coral run function potion_infusers:effects/success
execute if block ~ ~ ~ horn_coral run setblock ~ ~ ~ horn_coral_block
