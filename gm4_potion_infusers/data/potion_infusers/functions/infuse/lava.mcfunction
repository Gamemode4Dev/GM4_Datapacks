#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ magma_block run function potion_infusers:effects/failed
execute if block ~ ~ ~ magma_block run function potion_infusers:effects/success
execute if block ~ ~ ~ magma_block run setblock ~ ~ ~ lava
