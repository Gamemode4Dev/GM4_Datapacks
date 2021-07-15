# @s = block compressor
# run from main
execute positioned ~ ~1 ~ align xyz as @e[type=item,dx=0] positioned ~0.5 ~-0.9 ~0.5 run function gm4_block_compressors:item

particle portal ~ ~1.1 ~ 0 0 0 0.1 20

# 1.18 NOTE; This 16->17 backward compatibility may be removed.
data merge entity @s {HasVisualFire:1}

execute unless block ~ ~ ~ dropper run function gm4_block_compressors:destroy
