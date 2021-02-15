# @s = item ontop of tinkering compressor with 1 item inside (decompress mode)
# at @tinkering compressor positioned ~ ~0.9 ~
# run from tinkering_compressors:item

data modify storage tinkering_compressors:temp/decompress Item set from entity @s Item

# check for item type. Start with iron to reduce lag caused by iron farms.
execute if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:iron_block"} run function gm4_tinkering_compressors:decompress/iron_block

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:diamond_block"} run function gm4_tinkering_compressors:decompress/diamond_block

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:redstone_block"} run function gm4_tinkering_compressors:decompress/redstone_block

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:coal_block"} run function gm4_tinkering_compressors:decompress/coal_block

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:lapis_block"} run function gm4_tinkering_compressors:decompress/lapis_block

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:gold_ingot"} run function gm4_tinkering_compressors:decompress/gold_ingot

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:iron_ingot"} run function gm4_tinkering_compressors:decompress/iron_ingot

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:gold_block"} run function gm4_tinkering_compressors:decompress/gold_block

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:emerald_block"} run function gm4_tinkering_compressors:decompress/emerald_block

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:snow_block"} run function gm4_tinkering_compressors:decompress/snow_block

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:clay"} run function gm4_tinkering_compressors:decompress/clay

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:melon"} run function gm4_tinkering_compressors:decompress/melon

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:hay_block"} run function gm4_tinkering_compressors:decompress/hay_block

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:netherite_block"} run function gm4_tinkering_compressors:decompress/netherite_block

execute unless score ran_compressor gm4_tc_data matches 1.. if data storage tinkering_compressors:temp/decompress Item{id:"minecraft:slime_block"} run function gm4_tinkering_compressors:decompress/slime_block

# reset fake player
scoreboard players reset ran_compressor gm4_tc_data
