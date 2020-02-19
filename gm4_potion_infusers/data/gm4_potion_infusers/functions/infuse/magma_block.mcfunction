#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ netherrack run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ netherrack run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ netherrack run setblock ~ ~ ~ magma_block
