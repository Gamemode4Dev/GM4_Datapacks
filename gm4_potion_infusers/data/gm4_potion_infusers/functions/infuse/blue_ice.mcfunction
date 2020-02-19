#@s = infusing AEC with Age:80
#run from infusion

execute unless block ~ ~ ~ packed_ice run function gm4_potion_infusers:effects/failed
execute if block ~ ~ ~ packed_ice run function gm4_potion_infusers:effects/success
execute if block ~ ~ ~ packed_ice run setblock ~ ~ ~ blue_ice
