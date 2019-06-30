#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ gold_block run function potion_infusers:effects/failed
execute if block ~ ~ ~ gold_block run function potion_infusers:effects/success
execute if block ~ ~ ~ gold_block run setblock ~ ~ ~ bell
