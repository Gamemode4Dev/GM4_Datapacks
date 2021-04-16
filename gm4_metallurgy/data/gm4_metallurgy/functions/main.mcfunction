#give radiation poisoning
effect give @a[gamemode=!spectator,gamemode=!creative,nbt={Inventory:[{id:"minecraft:player_head",tag:{gm4_metallurgy:{metal:{type:"thorium"},item:"ore"}}}]}] minecraft:mining_fatigue 2 1

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

execute as @a run function gm4_metallurgy:player

execute as @e[scores={gm4_bolt_time=1..}] at @s run function gm4_ender_bolt_shamir:main
scoreboard players reset @a gm4_bolt_damage
execute as @e[type=trident,nbt={inGround:1b,Trident:{tag:{gm4_metallurgy:{active_shamir:"ender_bolt"}}}}] at @s run function gm4_ender_bolt_shamir:main

schedule function gm4_metallurgy:main 16t
