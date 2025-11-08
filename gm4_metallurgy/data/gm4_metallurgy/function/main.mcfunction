schedule function gm4_metallurgy:main 16t

# give radiation poisoning
effect give @a[gamemode=!spectator,gamemode=!creative,predicate=gm4_metallurgy:carries_thorium] minecraft:mining_fatigue 2 1

# manage moulds
execute as @e[type=armor_stand,tag=gm4_sand_ring] at @s positioned ~ ~1.23 ~ run function gm4_metallurgy:casting/sustain_mould

scoreboard players reset found_item_on_anvil gm4_ml_data
# check for moulds waiting to be created
execute as @e[type=item,predicate=gm4_metallurgy:is_obsidian,predicate=gm4_metallurgy:on_ground] at @s if block ~ ~-0.1 ~ #minecraft:sand run function gm4_metallurgy:casting/check_mould_creation

# check for shamir on anvil
execute as @e[type=item,tag=!gm4_ml_smooshed] if items entity @s contents *[count=1,custom_data~{gm4_metallurgy:{has_shamir:1b}}] at @s if block ~ ~-1 ~ #minecraft:anvil run function gm4_metallurgy:smooshing/item_on_anvil

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
execute as @e[type=trident,predicate=gm4_metallurgy:is_ender_bolt_trident,nbt={inGround:1b}] at @s run function gm4_ender_bolt_shamir:infection/symptoms
