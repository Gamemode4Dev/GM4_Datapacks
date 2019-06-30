#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ dark_prismarine run function potion_infusers:effects/failed
execute if block ~ ~ ~ dark_prismarine run function potion_infusers:effects/success
execute if block ~ ~ ~ dark_prismarine align xyz positioned ~0.5 ~ ~0.5 run summon guardian ~ ~ ~ {DeathLootTable:"potion_infusers:guardian"}
execute if block ~ ~ ~ dark_prismarine run setblock ~ ~ ~ air
