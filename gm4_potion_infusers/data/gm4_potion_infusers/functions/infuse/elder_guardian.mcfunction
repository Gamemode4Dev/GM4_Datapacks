#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ wet_sponge run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ wet_sponge run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ wet_sponge align xyz positioned ~0.5 ~ ~0.5 run summon elder_guardian ~ ~ ~ {DeathLootTable:"gm4_potion_infusers:elder_guardian"}
execute if block ~ ~ ~ wet_sponge run setblock ~ ~ ~ air
