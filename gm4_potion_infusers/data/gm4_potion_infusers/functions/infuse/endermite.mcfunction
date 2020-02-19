#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ end_stone run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ end_stone run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ end_stone align xyz positioned ~0.5 ~0.2 ~0.5 run summon endermite ~ ~ ~ {DeathLootTable:"gm4_potion_infusers:endermite",PlayerSpawned:1b}
execute if block ~ ~ ~ end_stone run setblock ~ ~ ~ air
