# @s = block compressor item
# run from smooshing/add_band/check

# replace the compressor item with a tinkering compressor item
loot spawn ~ ~ ~ loot gm4_tinkering_compressors:items/tinkering_compressor
kill @s
scoreboard players set valid_item gm4_ml_data 1

# use anvil durability
function gm4_metallurgy:smooshing/anvil/use
