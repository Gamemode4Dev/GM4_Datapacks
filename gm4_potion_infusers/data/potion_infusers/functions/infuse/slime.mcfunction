#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ slime_block run function potion_infusers:effects/failed
execute if block ~ ~ ~ slime_block run function potion_infusers:effects/success
execute if block ~ ~ ~ slime_block align xyz positioned ~0.5 ~0.2 ~0.5 run summon slime ~ ~ ~ {Size:2}
execute if block ~ ~ ~ slime_block run setblock ~ ~ ~ air
