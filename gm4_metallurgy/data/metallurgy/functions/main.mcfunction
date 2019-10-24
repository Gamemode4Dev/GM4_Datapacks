#restore placed and broken custom skulls
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head"}}] run function metallurgy:repair_skulls

#give radiation poisoning
effect give @a[nbt={Inventory:[{id:"minecraft:player_head",tag:{gm4_metallurgy:{ore_type:"thorium",item:"ore"}}}]}] minecraft:mining_fatigue 2 1

#log primed TNT
execute as @e[type=tnt] run scoreboard players set found_primed_tnt gm4_ml_data 1

#check for moulds waiting to be created
execute as @e[type=item,nbt={Item:{id:"minecraft:obsidian",Count:1b},OnGround:1b}] at @s if block ~ ~-0.1 ~ #minecraft:sand run function metallurgy:casting/check_mould_creation

#manage moulds
execute as @e[type=vex,tag=gm4_sand_ring] at @s run function metallurgy:casting/sustain_mould
execute as @e[type=item,tag=gm4_ml_in_animation,nbt=!{PickupDelay:30s}] run data remove entity @s Item.tag.gm4_metallurgy.ore_in_animation

#check for shamir on anvil
scoreboard players reset found_item_on_anvil gm4_ml_data
execute as @e[type=item,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{has_shamir:1b}}}},tag=!gm4_ml_smooshed] at @s if block ~ ~-1 ~ #minecraft:anvil run function metallurgy:smooshing/item_on_anvil

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

execute as @a[gamemode=!spectator] if data entity @s Inventory[].tag.gm4_metallurgy.active_shamir at @s run function metallurgy:has_shamir

execute as @a[gamemode=!spectator,scores={gm4_volt_time=-1..},tag=!gm4_has_conduction] at @s run function conduction_shamir:deselected_tool

execute as @a[tag=!gm4_has_musical] run function musical_shamir:songs/reset_player

execute as @e[scores={gm4_bolt_time=1..}] at @s run function ender_bolt_shamir:main
scoreboard players reset * gm4_bolt_damage
execute as @e[type=trident,nbt={inGround:1b,Trident:{tag:{gm4_metallurgy:{active_shamir:"ender_bolt"}}}}] at @s run function ender_bolt_shamir:main
