
scoreboard players remove @s gm4_hy_duration 1
scoreboard players set @s[scores={gm4_hy_duration=1..75},predicate=gm4_hydromancy:chance/frost_block_break] gm4_hy_duration 0

execute if score @s gm4_hy_duration matches 1.. if block ~ ~ ~ #gm4:replaceable run setblock ~ ~ ~ ice
execute if score @s gm4_hy_duration matches 0 run function gm4_hydromancy:spell_trident/frost/frost_block/remove
