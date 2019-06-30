#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ dead_brain_coral_block run function potion_infusers:effects/failed
execute if block ~ ~ ~ dead_brain_coral_block run function potion_infusers:effects/success
execute if block ~ ~ ~ dead_brain_coral_block run setblock ~ ~ ~ brain_coral_block
