#@s = liquid minecart
#run from load_liquid, unload_liquid and create

#calculate tank fullness percentage
scoreboard players operation @s gm4_lm_data = @s gm4_lt_value
scoreboard players operation @s gm4_lm_data *= #100 gm4_lm_data
scoreboard players operation @s gm4_lm_data /= @s gm4_lt_max

#1%-50%
execute if score @s gm4_lt_value matches 1.. if score @s gm4_lm_data matches 0..50 on passengers run data modify entity @s[type=item_display,tag=gm4_liquid_minecart_display] item merge value {id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$liquid_minecart_display/low"}}
#51%-99%
execute unless score @s gm4_lt_value = @s gm4_lt_max if score @s gm4_lm_data matches 51..100 on passengers run data modify entity @s[type=item_display,tag=gm4_liquid_minecart_display] item merge value {id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$liquid_minecart_display/high"}}
#100%
execute if score @s gm4_lt_value = @s gm4_lt_max on passengers run data modify entity @s[type=item_display,tag=gm4_liquid_minecart_display] item merge value {id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$liquid_minecart_display/full"}}
#0%
execute if score @s gm4_lt_value matches 0 on passengers run data modify entity @s[type=item_display,tag=gm4_liquid_minecart_display] item merge value {id:"minecraft:player_head",count:1,components:{"minecraft:profile":"$liquid_minecart_display/empty"}}
