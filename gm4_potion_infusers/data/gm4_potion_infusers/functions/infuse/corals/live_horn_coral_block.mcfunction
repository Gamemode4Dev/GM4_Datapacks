#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ dead_horn_coral_block run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ dead_horn_coral_block run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ dead_horn_coral_block run setblock ~ ~ ~ horn_coral_block
