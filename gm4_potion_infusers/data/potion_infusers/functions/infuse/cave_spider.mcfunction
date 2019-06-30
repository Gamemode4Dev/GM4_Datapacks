#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ cobweb run function potion_infusers:effects/failed
execute if block ~ ~ ~ cobweb run function potion_infusers:effects/success
execute if block ~ ~ ~ cobweb align xyz positioned ~0.5 ~0.2 ~0.5 run summon cave_spider ~ ~ ~ {DeathLootTable:"potion_infusers:cave_spider"}
execute if block ~ ~ ~ cobweb run setblock ~ ~ ~ air
