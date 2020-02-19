#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ stone run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ stone run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ stone run setblock ~ ~ ~ stone_bricks
