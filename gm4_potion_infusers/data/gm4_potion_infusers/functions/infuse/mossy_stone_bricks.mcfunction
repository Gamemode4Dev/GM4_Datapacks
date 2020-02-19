#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ stone_bricks run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ stone_bricks run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ stone_bricks run setblock ~ ~ ~ mossy_stone_bricks
