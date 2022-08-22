# code taken from sweethearts
# @s = player to heal
# at world spawn
# run from any armor/active/heal/heal_calc

# calculate max health to get player to new health
scoreboard players operation $remove_health gm4_ce_data = $max_health gm4_ce_data
scoreboard players operation $remove_health gm4_ce_data -= @s gm4_ce_health
scoreboard players operation $remove_health gm4_ce_data -= @s gm4_ce_healstore
execute if score $remove_health gm4_ce_data matches ..-1 run scoreboard players set $remove_health gm4_ce_data 0

# lower player's max health to their new health
execute if score $remove_health gm4_ce_data matches 512.. run attribute @s minecraft:generic.max_health modifier add 8a3726c1-9a5c-4b10-86ba-b72a2540eeb2 "gm4_ce_remove_512" -512 add
execute if score $remove_health gm4_ce_data matches 512.. run scoreboard players remove $remove_health gm4_ce_data 512
execute if score $remove_health gm4_ce_data matches 256.. run attribute @s minecraft:generic.max_health modifier add 8c30a1b2-d915-4d46-93cc-49470b558bf9 "gm4_ce_remove_256" -256 add
execute if score $remove_health gm4_ce_data matches 256.. run scoreboard players remove $remove_health gm4_ce_data 256
execute if score $remove_health gm4_ce_data matches 128.. run attribute @s minecraft:generic.max_health modifier add 236c6079-0f55-4a22-b02d-2110b6a845fc "gm4_ce_remove_128" -128 add
execute if score $remove_health gm4_ce_data matches 128.. run scoreboard players remove $remove_health gm4_ce_data 128
execute if score $remove_health gm4_ce_data matches 64.. run attribute @s minecraft:generic.max_health modifier add 3017b672-58d6-451a-97cf-c3f4b08f6282 "gm4_ce_remove_64" -64 add
execute if score $remove_health gm4_ce_data matches 64.. run scoreboard players remove $remove_health gm4_ce_data 64
execute if score $remove_health gm4_ce_data matches 32.. run attribute @s minecraft:generic.max_health modifier add fc8491d8-e398-44ed-b79d-c0d6bc648501 "gm4_ce_remove_32" -32 add
execute if score $remove_health gm4_ce_data matches 32.. run scoreboard players remove $remove_health gm4_ce_data 32
execute if score $remove_health gm4_ce_data matches 16.. run attribute @s minecraft:generic.max_health modifier add 17948ed4-e422-47af-880e-7cc1a09cac92 "gm4_ce_remove_16" -16 add
execute if score $remove_health gm4_ce_data matches 16.. run scoreboard players remove $remove_health gm4_ce_data 16
execute if score $remove_health gm4_ce_data matches 8.. run attribute @s minecraft:generic.max_health modifier add edf68005-ec49-4e92-a311-2a54ea4870d9 "gm4_ce_remove_8" -8 add
execute if score $remove_health gm4_ce_data matches 8.. run scoreboard players remove $remove_health gm4_ce_data 8
execute if score $remove_health gm4_ce_data matches 4.. run attribute @s minecraft:generic.max_health modifier add 4bd118d8-a5dd-4bec-a93b-8d4daeab14be "gm4_ce_remove_4" -4 add
execute if score $remove_health gm4_ce_data matches 4.. run scoreboard players remove $remove_health gm4_ce_data 4
execute if score $remove_health gm4_ce_data matches 2.. run attribute @s minecraft:generic.max_health modifier add 0caacdc0-1ca3-4e75-90c4-2756efe9ca50 "gm4_ce_remove_2" -2 add
execute if score $remove_health gm4_ce_data matches 2.. run scoreboard players remove $remove_health gm4_ce_data 2
execute if score $remove_health gm4_ce_data matches 1.. run attribute @s minecraft:generic.max_health modifier add cb62a34a-4a87-4c18-b0a0-6bb31d2e9300 "gm4_ce_remove_1" -1 add
execute if score $remove_health gm4_ce_data matches 1.. run scoreboard players remove $remove_health gm4_ce_data 1

# prepare reverting
tag @s add gm4_ce_healed
schedule function gm4_combat_expanded:player/heal/context 1t
