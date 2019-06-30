#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ quartz_block run function potion_infusers:effects/failed
execute if block ~ ~ ~ quartz_block run function potion_infusers:effects/success
execute if block ~ ~ ~ quartz_block align xyz positioned ~0.5 ~0.5 ~0.5 run summon ghast ~ ~ ~ {DeathLootTable:"potion_infusers:ghast",Health:30f,Attributes:[{Name:generic.maxHealth,Base:30}]}
execute if block ~ ~ ~ quartz_block run setblock ~ ~ ~ air
