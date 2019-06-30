#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ brain_coral run function potion_infusers:effects/failed
execute if block ~ ~ ~ brain_coral run function potion_infusers:effects/success
execute if block ~ ~ ~ brain_coral run setblock ~ ~ ~ brain_coral_block
