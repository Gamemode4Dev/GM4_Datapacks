schedule function gm4_metallurgy:main 16t

# give radiation poisoning
effect give @a[gamemode=!spectator,gamemode=!creative,predicate=gm4_metallurgy:carries_thorium] minecraft:mining_fatigue 2 1

# manage moulds
execute as @e[type=armor_stand,tag=gm4_sand_ring] at @s positioned ~ ~1.23 ~ run function gm4_metallurgy:casting/sustain_mould

# check for moulds waiting to be created
execute as @e[type=item,predicate=gm4_metallurgy:is_obsidian,predicate=gm4_metallurgy:on_ground] at @s if block ~ ~-0.1 ~ #minecraft:sand align xyz unless entity @e[type=armor_stand,tag=gm4_sand_ring,dx=0,dy=-1,dz=0,limit=1] if entity @e[type=item,dx=0,dy=0,dz=0,predicate=gm4_metallurgy:is_clay_ball,predicate=gm4_metallurgy:on_ground,limit=1] run function gm4_metallurgy:casting/create_mould

# check for shamir on anvil
scoreboard players reset found_item_on_anvil gm4_ml_data
execute as @e[type=item,tag=!gm4_ml_smooshed,predicate=gm4_metallurgy:on_ground,predicate=gm4_metallurgy:smooshing/has_shamir] at @s if block ~ ~-1 ~ #minecraft:anvil run function gm4_metallurgy:smooshing/item_on_anvil

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
