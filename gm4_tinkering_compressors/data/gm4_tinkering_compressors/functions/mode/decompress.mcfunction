# @s = item ontop of tinkering compressor with 1 item inside (decompress mode)
# at @tinkering compressor positioned ~ ~0.9 ~
# run from tinkering_compressors:item

# check for item type. 
# iron farms
execute if items entity @s contents minecraft:iron_block run function gm4_tinkering_compressors:decompress/iron_block
# auto farms
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:melon run function gm4_tinkering_compressors:decompress/melon
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:hay_block run function gm4_tinkering_compressors:decompress/hay_block
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:slime_block run function gm4_tinkering_compressors:decompress/slime_block
# metals/minerals
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:gold_ingot run function gm4_tinkering_compressors:decompress/gold_ingot
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:iron_ingot run function gm4_tinkering_compressors:decompress/iron_ingot
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:gold_block run function gm4_tinkering_compressors:decompress/gold_block
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:copper_block run function gm4_tinkering_compressors:decompress/copper_block
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:raw_iron_block run function gm4_tinkering_compressors:decompress/raw_iron_block
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:raw_copper_block run function gm4_tinkering_compressors:decompress/raw_copper_block
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:raw_gold_block run function gm4_tinkering_compressors:decompress/raw_gold_block
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:redstone_block run function gm4_tinkering_compressors:decompress/redstone_block
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:emerald_block run function gm4_tinkering_compressors:decompress/emerald_block
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:diamond_block run function gm4_tinkering_compressors:decompress/diamond_block
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:coal_block run function gm4_tinkering_compressors:decompress/coal_block
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:lapis_block run function gm4_tinkering_compressors:decompress/lapis_block
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:netherite_block run function gm4_tinkering_compressors:decompress/netherite_block
# other
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:snow_block run function gm4_tinkering_compressors:decompress/snow_block
execute unless score $ran_compressor gm4_tc_data matches 1.. if items entity @s contents minecraft:clay run function gm4_tinkering_compressors:decompress/clay

# reset fake player
scoreboard players reset $ran_compressor gm4_tc_data
