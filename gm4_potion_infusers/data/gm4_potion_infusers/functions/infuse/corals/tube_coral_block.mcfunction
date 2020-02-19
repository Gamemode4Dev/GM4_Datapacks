#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ tube_coral run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ tube_coral run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ tube_coral run setblock ~ ~ ~ tube_coral_block
