#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ #minecraft:leaves run function potion_infusers:effects/failed
execute if block ~ ~ ~ #minecraft:leaves run function potion_infusers:effects/success
execute if block ~ ~ ~ #minecraft:leaves align xyz positioned ~0.5 ~0.2 ~0.5 run summon bat ~ ~ ~ {DeathLootTable:"potion_infusers:bat"}
execute if block ~ ~ ~ #minecraft:leaves run setblock ~ ~ ~ air
