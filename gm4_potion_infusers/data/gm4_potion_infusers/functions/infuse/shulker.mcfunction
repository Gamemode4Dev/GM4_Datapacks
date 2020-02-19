#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ purpur_block run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ purpur_block run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ purpur_block align xyz positioned ~0.5 ~ ~0.5 run summon shulker ~ ~ ~ {Color:16,DeathLootTable:"gm4_potion_infusers:shulker"}
execute if block ~ ~ ~ purpur_block run setblock ~ ~ ~ air
