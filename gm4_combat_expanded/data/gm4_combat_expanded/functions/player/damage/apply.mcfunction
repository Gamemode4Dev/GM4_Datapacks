# code taken from sweethearts
# @s = player that is taking damage
# at world spawn
# run from armor/type/guardian/damage_calc 
# run from weapon/modifier/delay/explode_player

# lower player's max health to their new health
execute if score $remove_health gm4_ce_data matches 512.. run attribute @s minecraft:generic.max_health modifier add d5694a36-93b0-4f59-b3a3-1dc2e421ea2b "gm4_ce_remove_512" -512 add
execute if score $remove_health gm4_ce_data matches 512.. run scoreboard players remove $remove_health gm4_ce_data 512
execute if score $remove_health gm4_ce_data matches 256.. run attribute @s minecraft:generic.max_health modifier add bb783756-23a1-4ae4-b7ed-4132ae7b01cf "gm4_ce_remove_256" -256 add
execute if score $remove_health gm4_ce_data matches 256.. run scoreboard players remove $remove_health gm4_ce_data 256
execute if score $remove_health gm4_ce_data matches 128.. run attribute @s minecraft:generic.max_health modifier add 6c2f8531-80c5-4a8b-b09a-0a090a08a475 "gm4_ce_remove_128" -128 add
execute if score $remove_health gm4_ce_data matches 128.. run scoreboard players remove $remove_health gm4_ce_data 128
execute if score $remove_health gm4_ce_data matches 64.. run attribute @s minecraft:generic.max_health modifier add 2154cdc2-d5c6-41da-b543-03975792145f "gm4_ce_remove_64" -64 add
execute if score $remove_health gm4_ce_data matches 64.. run scoreboard players remove $remove_health gm4_ce_data 64
execute if score $remove_health gm4_ce_data matches 32.. run attribute @s minecraft:generic.max_health modifier add a0506b3f-6869-4e95-8b6f-a2d6ca618171 "gm4_ce_remove_32" -32 add
execute if score $remove_health gm4_ce_data matches 32.. run scoreboard players remove $remove_health gm4_ce_data 32
execute if score $remove_health gm4_ce_data matches 16.. run attribute @s minecraft:generic.max_health modifier add 7ef3924f-d322-41e8-8265-572a6920dbef "gm4_ce_remove_16" -16 add
execute if score $remove_health gm4_ce_data matches 16.. run scoreboard players remove $remove_health gm4_ce_data 16
execute if score $remove_health gm4_ce_data matches 8.. run attribute @s minecraft:generic.max_health modifier add e7a55cfa-7a19-431c-a5c7-3dcb479867f1 "gm4_ce_remove_8" -8 add
execute if score $remove_health gm4_ce_data matches 8.. run scoreboard players remove $remove_health gm4_ce_data 8
execute if score $remove_health gm4_ce_data matches 4.. run attribute @s minecraft:generic.max_health modifier add a2620070-9602-4c12-bcec-0622d829ccd1 "gm4_ce_remove_4" -4 add
execute if score $remove_health gm4_ce_data matches 4.. run scoreboard players remove $remove_health gm4_ce_data 4
execute if score $remove_health gm4_ce_data matches 2.. run attribute @s minecraft:generic.max_health modifier add cfe9d178-ad5a-482f-9462-3a2eb9a66246 "gm4_ce_remove_2" -2 add
execute if score $remove_health gm4_ce_data matches 2.. run scoreboard players remove $remove_health gm4_ce_data 2
execute if score $remove_health gm4_ce_data matches 1.. run attribute @s minecraft:generic.max_health modifier add 56ee6b7f-c37a-4cdf-bff5-4a65ab6173fa "gm4_ce_remove_1" -1 add
execute if score $remove_health gm4_ce_data matches 1.. run scoreboard players remove $remove_health gm4_ce_data 1

# damage player
attribute @s minecraft:generic.max_health modifier add 41d5f53b-aaa9-4e50-ad7d-e10361a9950d "gm4_ce_instant_damage_buffer" 3 add
effect give @s minecraft:instant_health 1 10 true
effect give @s minecraft:instant_damage 1 0 true

# prepare reverting
tag @s add gm4_ce_damaged
schedule function gm4_combat_expanded:player/damage/context 2t
