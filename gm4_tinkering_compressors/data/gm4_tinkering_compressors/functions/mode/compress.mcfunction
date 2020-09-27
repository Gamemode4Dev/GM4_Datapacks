# @s = item ontop of tinkering compressor with 64 items inside (compress mode)
# at @tinkering compressor positioned ~ ~0.9 ~
# run from tinkering_compressors:item

# check for item type. Start with iron to reduce lag caused by iron farms.
execute if entity @s[nbt={Item:{id:"minecraft:iron_ingot"}}] run function gm4_tinkering_compressors:compress/iron_ingot

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:diamond"}}] run function gm4_tinkering_compressors:compress/diamond

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:redstone"}}] run function gm4_tinkering_compressors:compress/redstone

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:coal"}}] run function gm4_tinkering_compressors:compress/coal

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:lapis_lazuli"}}] run function gm4_tinkering_compressors:compress/lapis_lazuli

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:gold_ingot"}}] run function gm4_tinkering_compressors:compress/gold_ingot

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:emerald"}}] run function gm4_tinkering_compressors:compress/emerald

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:gold_nugget"}}] run function gm4_tinkering_compressors:compress/gold_nugget

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:iron_nugget"}}] run function gm4_tinkering_compressors:compress/iron_nugget

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:snowball"}}] run function gm4_tinkering_compressors:compress/snowball

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:clay_ball"}}] run function gm4_tinkering_compressors:compress/clay_ball

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:melon_slice"}}] run function gm4_tinkering_compressors:compress/melon_slice

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:wheat"}}] run function gm4_tinkering_compressors:compress/wheat

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:netherite_ingot"}}] run function gm4_tinkering_compressors:compress/netherite_ingot

execute unless score ran_compressor gm4_tc_data matches 1.. if entity @s[nbt={Item:{id:"minecraft:slime_ball"}}] run function gm4_tinkering_compressors:compress/slime_ball

# reset fake player
scoreboard players reset ran_compressor gm4_tc_data
