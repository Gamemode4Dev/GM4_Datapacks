# @s = tinkering compressor
# run from main

execute positioned ~ ~0.9 ~ if entity @e[type=item,tag=!gm4_tc_locked,distance=..1,nbt=!{Item:{tag:{gm4_compressed:{}}}}] positioned ~ ~-0.9 ~ run function tinkering_compressors:item

particle dust 0.624 0.769 0.671 1 ~ ~1.2 ~ 0 0.15 0 0.1 20
data merge entity @s {Fire:2000}

execute unless block ~ ~ ~ dropper run function tinkering_compressors:destroy
