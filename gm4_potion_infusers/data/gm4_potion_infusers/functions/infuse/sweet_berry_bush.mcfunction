#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ sweet_berry_bush run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ sweet_berry_bush run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ sweet_berry_bush run setblock ~ ~ ~ sweet_berry_bush[age=3]
