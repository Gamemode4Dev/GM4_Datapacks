# give radiation poisoning
effect give @a[gamemode=!spectator,gamemode=!creative,nbt={Inventory:[{id:"minecraft:player_head",tag:{gm4_metallurgy:{metal:{type:"thorium"},item:"ore"}}}]}] minecraft:mining_fatigue 2 1

# manage moulds
execute as @e[type=armor_stand,tag=gm4_sand_ring] at @s align xyz positioned ~ ~1 ~ run function gm4_metallurgy:casting/sustain_mould

# manage items
scoreboard players reset found_item_on_anvil gm4_ml_data
execute as @e[type=item] run function gm4_metallurgy:item

#============================== SHAMIR CLOCKING ================================
#             (for shamirs that are included with the base module)
scoreboard players set $arborenda_active gm4_ml_data 0
scoreboard players set $hypexperia_active gm4_ml_data 0
scoreboard players add $current_sensus_layer gm4_ml_data 1
execute if score $current_sensus_layer gm4_ml_data matches 6.. run scoreboard players set $current_sensus_layer gm4_ml_data 0

scoreboard players reset $tool_max_damage gm4_ml_data
scoreboard players reset $tool_current_damage gm4_ml_data

execute as @a run function gm4_metallurgy:player

execute as @e[scores={gm4_bolt_time=-40..}] at @s run function gm4_ender_bolt_shamir:infection/active
execute as @e[type=trident,nbt={inGround:1b,Trident:{tag:{gm4_metallurgy:{active_shamir:"ender_bolt"}}}}] at @s run function gm4_ender_bolt_shamir:infection/active

schedule function gm4_metallurgy:main 16t
