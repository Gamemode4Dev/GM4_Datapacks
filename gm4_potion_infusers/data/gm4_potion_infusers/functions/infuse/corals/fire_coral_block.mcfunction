#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ fire_coral run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ fire_coral run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ fire_coral run setblock ~ ~ ~ fire_coral_block
