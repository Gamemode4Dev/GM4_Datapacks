#@s = liquid minecart
#run from load_liquid, unload_liquid and create

#calculate tank fullness percentage
scoreboard players operation @s gm4_lm_data = @s gm4_lt_value
scoreboard players operation @s gm4_lm_data *= #100 gm4_lm_data
scoreboard players operation @s gm4_lm_data /= @s gm4_lt_max

#1%-50%
execute if score @s gm4_lt_value matches 1.. if score @s gm4_lm_data matches 0..50 run data modify entity @e[type=armor_stand,tag=gm4_liquid_minecart_stand,limit=1,sort=nearest] ArmorItems[3] merge value {id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$liquid_minecart_display/low"}}
#51%-99%
execute unless score @s gm4_lt_value = @s gm4_lt_max if score @s gm4_lm_data matches 51..100 run data modify entity @e[type=armor_stand,tag=gm4_liquid_minecart_stand,limit=1,sort=nearest] ArmorItems[3] merge value {id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$liquid_minecart_display/high"}}
#100%
execute if score @s gm4_lt_value = @s gm4_lt_max run data modify entity @e[type=armor_stand,tag=gm4_liquid_minecart_stand,limit=1,sort=nearest] ArmorItems[3] merge value {id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$liquid_minecart_display/full"}}
#0%
execute if score @s gm4_lt_value matches 0 run data modify entity @e[type=armor_stand,tag=gm4_liquid_minecart_stand,limit=1,sort=nearest] ArmorItems[3] merge value {id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"$liquid_minecart_display/empty"}}
