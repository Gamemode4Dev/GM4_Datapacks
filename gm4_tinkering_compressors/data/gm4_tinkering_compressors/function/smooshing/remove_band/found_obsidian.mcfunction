# @s = obsidian item, @e[tag=gm4_ml_source] = tinkering compressor item
# run from smooshing/prepare_transfer

execute as @e[type=item,tag=gm4_ml_source,limit=1] at @s run function gm4_tinkering_compressors:smooshing/remove_band/convert_to_block_compressor
kill @s

# use anvil durability
function gm4_metallurgy:smooshing/anvil/use
