#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ bubble_coral run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ bubble_coral run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ bubble_coral run setblock ~ ~ ~ bubble_coral_block
