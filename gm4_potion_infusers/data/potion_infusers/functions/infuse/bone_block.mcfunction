#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ coal_block run function potion_infusers:effects/failed
execute if block ~ ~ ~ coal_block run function potion_infusers:effects/success
execute if block ~ ~ ~ coal_block run setblock ~ ~ ~ bone_block
