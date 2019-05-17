#restore placed and broken custom skulls
#execute as @e[type=item,nbt={Item:{id:"minecraft:player_head"}}] run function metallurgy:repair_skulls

#give radiation poisoning
effect give @a[nbt={Inventory:[{id:"minecraft:player_head",tag:{gm4_metallurgy:{ore_type:"thorium",item:"ore"}}}]}] minecraft:mining_fatigue 2 1

#log primed TNT
execute as @e[type=tnt] run scoreboard players set found_primed_tnt gm4_ml_data 1

#check for moulds waiting to be created
execute at @e[type=item,nbt={Item:{id:"minecraft:obsidian",Count:1b},Motion:[0.0,0.0,0.0]},limit=1] if block ~ ~-1 ~ #minecraft:sand align xyz unless entity @e[type=vex,tag=gm4_sand_ring,dx=0,dy=-1,dz=0] if entity @e[type=item,nbt={Item:{id:"minecraft:clay_ball",Count:1b},Motion:[0.0,0.0,0.0]},dx=0,dy=0,dz=0] run function metallurgy:casting/create_mould

#manage moulds
execute as @e[type=vex,tag=gm4_sand_ring] at @s run function metallurgy:casting/sustain_mould

#check for shamir on anvil
scoreboard players reset found_item_on_anvil gm4_ml_data
execute as @e[type=item,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{has_shamir:1b}}}},tag=!gm4_ml_smooshed] at @s if block ~ ~-1 ~ #minecraft:anvil run function metallurgy:smooshing/item_on_anvil

#============================== SHAMIR CLOCKING ================================
#             (for shamirs that are included with the base module)

#----------------------------------- DEFUSE ------------------------------------
execute if entity @a[gamemode=!spectator,nbt={Inventory:[{tag:{gm4_metallurgy:{active_shamir:"defuse"}}}]}] run function defuse_shamir:main

#--------------------------------- SPIRACULUM ----------------------------------
tag @a remove gm4_has_spiraculum
execute as @a[gamemode=!spectator,nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"spiraculum"}}}}] at @s run function spiraculum_shamir:main
execute as @a[gamemode=!spectator,nbt={Inventory:[{Slot:-106b,tag:{gm4_metallurgy:{active_shamir:"spiraculum"}}}]},nbt=!{SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"spiraculum"}}}}] at @s run function spiraculum_shamir:main
#--------------------------------- ARBORENDA -----------------------------------
tag @a remove gm4_has_arborenda
tag @a[gamemode=!spectator,nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"arborenda"}}}}] add gm4_has_arborenda
scoreboard players set arborenda_active gm4_ml_data 0
execute as @a[gamemode=!spectator,tag=gm4_has_arborenda] run scoreboard players set arborenda_active gm4_ml_data 1
#--------------------------------- CONDUCTION ----------------------------------
tag @a remove gm4_has_conduction
execute as @a[gamemode=!spectator,nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"conduction"}}}}] run function conduction_shamir:main
execute as @a[gamemode=!spectator,nbt={Inventory:[{Slot:-106b,tag:{gm4_metallurgy:{active_shamir:"conduction"}}}]},nbt=!{SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"conduction"}}}}] run function conduction_shamir:main
execute as @a[gamemode=!spectator,scores={gm4_volt_time=-1..},tag=!gm4_has_conduction] at @s run function conduction_shamir:deselected_tool
#----------------------------------- TINKER ------------------------------------
tag @a remove gm4_has_tinker
execute as @a[gamemode=!spectator,nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"tinker"}}}}] at @s run function tinker_shamir:main
#--------------------------------- HYPEXPERIA ----------------------------------
scoreboard players set hypexperia_active gm4_ml_data 0
tag @a remove gm4_has_hypexperia
execute as @a[gamemode=!spectator,nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"hypexperia"}}}}] at @s run function hypexperia_shamir:main
execute as @a[gamemode=!spectator,nbt={Inventory:[{Slot:-106b,tag:{gm4_metallurgy:{active_shamir:"hypexperia"}}}]},nbt=!{SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"hypexperia"}}}}] at @s run function hypexperia_shamir:main
#--------------------------------- FORTERRA ------------------------------------
scoreboard players set forterra_active gm4_ml_data 0
tag @a remove gm4_has_forterra
execute as @a[gamemode=!spectator,nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"forterra"}}}}] at @s run function forterra_shamir:main

#-------------------------------- ENDER BOLT -----------------------------------
execute as @e[scores={gm4_bolt_time=1..}] at @s run function ender_bolt_shamir:main
scoreboard players reset @a gm4_bolt_damage
execute as @e[type=trident,nbt={inGround:1b}] at @s run function ender_bolt_shamir:main

#---------------------------------- MUSICAL ------------------------------------
tag @a remove gm4_has_musical
execute as @a[gamemode=!spectator,scores={gm4_note_collect=1..},nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"musical"}}}}] at @s run function musical_shamir:main
execute as @a[tag=!gm4_has_musical] run function musical_shamir:songs/reset_player

#---------------------------------- SENSUS -------------------------------------
#global layer counter
scoreboard players add current_sensus_layer gm4_sensus_layer 1
execute if score current_sensus_layer gm4_sensus_layer matches 6.. run scoreboard players set current_sensus_layer gm4_sensus_layer 0
#run sensus functions
tag @a remove gm4_has_sensus
execute as @a[gamemode=!spectator,nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"sensus"}}}}] at @s run function sensus_shamir:main
execute as @a[gamemode=!spectator,nbt={Inventory:[{Slot:-106b,tag:{gm4_metallurgy:{active_shamir:"sensus"}}}]},nbt=!{SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"sensus"}}}}] at @s run function sensus_shamir:main


#---------------------------------- LEVITY -------------------------------------
scoreboard players set levity_active gm4_ml_data 0
tag @a remove gm4_has_levity
execute as @a[gamemode=!spectator,nbt={Inventory:[{Slot:100b,tag:{gm4_metallurgy:{active_shamir:"levity"}}}]}] at @s run function levity_shamir:main
