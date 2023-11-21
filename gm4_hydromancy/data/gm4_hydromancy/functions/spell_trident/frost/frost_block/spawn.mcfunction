
execute unless entity @e[type=marker,tag=gm4_hy_frost_block] run schedule function gm4_hydromancy:spell_trident/frost/frost_block/tick 1t

tag @s add gm4_hy_frost_block

execute if block ~ ~ ~ water[level=0] run tag @s add gm4_hy_frost_block.water
execute if block ~ ~ ~ #gm4:replaceable[waterlogged=true] run tag @s add gm4_hy_frost_block.water
setblock ~ ~ ~ ice
scoreboard players set @s gm4_hy_duration 300
