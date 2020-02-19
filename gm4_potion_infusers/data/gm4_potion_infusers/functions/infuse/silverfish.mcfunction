#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ cracked_stone_bricks run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ cracked_stone_bricks run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ cracked_stone_bricks align xyz positioned ~0.5 ~0.2 ~0.5 run summon silverfish ~ ~ ~ {DeathLootTable:"gm4_potion_infusers:silverfish"}
execute if block ~ ~ ~ cracked_stone_bricks run setblock ~ ~ ~ air
