
execute as @e[type=marker,tag=gm4_hy_frost_block] at @s run function gm4_hydromancy:spell_trident/frost/frost_block/process

execute as @e[type=trident,tag=gm4_hy_spell_trident.frost_casting] at @s run function gm4_hydromancy:spell_trident/frost/process_casting

execute if entity @e[type=marker,tag=gm4_hy_frost_block] run schedule function gm4_hydromancy:spell_trident/frost/frost_block/tick 1t
