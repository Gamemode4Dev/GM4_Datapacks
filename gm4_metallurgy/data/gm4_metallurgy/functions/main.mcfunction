#give radiation poisoning
effect give @a[nbt={Inventory:[{id:"minecraft:player_head",tag:{gm4_metallurgy:{ore_type:"thorium",item:"ore"}}}]}] minecraft:mining_fatigue 2 1

#manage moulds
execute as @e[type=vex,tag=gm4_sand_ring] at @s run function gm4_metallurgy:casting/sustain_mould

#manage items
scoreboard players reset found_item_on_anvil gm4_ml_data
execute as @e[type=item] run function gm4_metallurgy:item

#============================== SHAMIR CLOCKING ================================
#             (for shamirs that are included with the base module)

scoreboard players set arborenda_active gm4_ml_data 0
scoreboard players set hypexperia_active gm4_ml_data 0
scoreboard players set forterra_active gm4_ml_data 0
scoreboard players set levity_active gm4_ml_data 0
scoreboard players add current_sensus_layer gm4_ml_data 1
execute if score current_sensus_layer gm4_ml_data matches 6.. run scoreboard players set current_sensus_layer gm4_ml_data 0

tag @a remove gm4_has_spiraculum
tag @a remove gm4_has_arborenda
tag @a remove gm4_has_conduction
tag @a remove gm4_has_tinker
tag @a remove gm4_has_hypexperia
tag @a remove gm4_has_musical
tag @a remove gm4_has_sensus
tag @a remove gm4_has_levity
tag @a remove gm4_has_forterra

execute as @a[gamemode=!spectator,predicate=gm4_metallurgy:shamir_in_hand] at @s run function gm4_metallurgy:shamir_in_hand
execute as @a[gamemode=!spectator,predicate=gm4_metallurgy:shamir_equipped] at @s run function gm4_metallurgy:shamir_equipped

execute as @a[gamemode=!spectator,scores={gm4_volt_time=-1..},tag=!gm4_has_conduction] at @s run function gm4_conduction_shamir:deselected_tool

execute as @a[tag=!gm4_has_musical] run function gm4_musical_shamir:songs/reset_player

execute as @e[scores={gm4_bolt_time=1..}] at @s run function gm4_ender_bolt_shamir:main
scoreboard players reset * gm4_bolt_damage
execute as @e[type=trident,nbt={inGround:1b,Trident:{tag:{gm4_metallurgy:{active_shamir:"ender_bolt"}}}}] at @s run function gm4_ender_bolt_shamir:main

schedule function gm4_metallurgy:main 16t
