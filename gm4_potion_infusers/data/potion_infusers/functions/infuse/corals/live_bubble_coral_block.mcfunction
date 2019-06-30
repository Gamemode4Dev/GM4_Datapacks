#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ dead_bubble_coral_block run function potion_infusers:effects/failed
execute if block ~ ~ ~ dead_bubble_coral_block run function potion_infusers:effects/success
execute if block ~ ~ ~ dead_bubble_coral_block run setblock ~ ~ ~ bubble_coral_block
