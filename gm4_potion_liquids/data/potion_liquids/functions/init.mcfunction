#announce module installation
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Installing Potion Liquids..."}]
execute unless entity @p run say GM4: Installing Potion Liquids...

#declare and initialise scoreboards and settings
scoreboard players set update_happened gm4_up_check 1
scoreboard players set potion_liquids gm4_modules 1
#scoreboard players set potion_liquids gm4_clock_tick 0   ##Module Run by Liquid Tanks Base

#announce success
tellraw @a[gamemode=creative] ["",{"text":"[GM4]: Potion Liquids Installed!"}]
execute unless entity @p run say GM4: Potion Liquids Installed!

#check other modules to make sure they're up to date.
kill @e[tag=gm4_update_message]
execute if score bat_grenades gm4_modules matches ..3 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Bat Grenades\"",Tags:["gm4_update_message"],Duration:2000}
execute if score better_armour_stands gm4_modules matches ..3 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Better Armour Stands\"",Tags:["gm4_update_message"],Duration:2000}
execute if score better_fire gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Better Fire\"",Tags:["gm4_update_message"],Duration:2000}
execute if score block_compressors gm4_modules matches ..2 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Block Compressors\"",Tags:["gm4_update_message"],Duration:2000}
execute if score boots_of_ostara gm4_modules matches ..3 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Boots Of Ostara\"",Tags:["gm4_update_message"],Duration:2000}
execute if score chairs gm4_modules matches ..2 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Chairs\"",Tags:["gm4_update_message"],Duration:2000}
execute if score cooler_caves gm4_modules matches ..0 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Cooler Caves\"",Tags:["gm4_update_message"],Duration:2000}
execute if score custom_crafters gm4_modules matches ..4 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Custom Crafters\"",Tags:["gm4_update_message"],Duration:2000}
execute if score dangerous_dungeons gm4_modules matches ..0 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Dangerous Dungeons\"",Tags:["gm4_update_message"],Duration:2000}
execute if score desire_lines gm4_modules matches ..2 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Desire Lines\"",Tags:["gm4_update_message"],Duration:2000}
execute if score disassemblers gm4_modules matches ..3 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Disassemblers\"",Tags:["gm4_update_message"],Duration:2000}
execute if score enchantment_extractors gm4_modules matches ..2 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Enchantment Extractors\"",Tags:["gm4_update_message"],Duration:2000}
execute if score ender_hoppers gm4_modules matches ..3 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Ender Hoppers\"",Tags:["gm4_update_message"],Duration:2000}
execute if score enderman_support_class gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Enderman Support Class\"",Tags:["gm4_update_message"],Duration:2000}
execute if score heart_canisters gm4_modules matches ..4 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Heart Canisters\"",Tags:["gm4_update_message"],Duration:2000}
execute if score ink_spitting_squid gm4_modules matches ..3 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Ink Spitting Squid\"",Tags:["gm4_update_message"],Duration:2000}
execute if score lightning_rods gm4_modules matches ..3 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Lightning Rods\"",Tags:["gm4_update_message"],Duration:2000}
execute if score liquid_tanks gm4_modules matches ..0 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Liquid Tanks\"",Tags:["gm4_update_message"],Duration:2000}
execute if score master_crafting gm4_modules matches ..3 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Master Crafting\"",Tags:["gm4_update_message"],Duration:2000}
execute if score mob_conversion gm4_modules matches ..4 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Mob Conversion\"",Tags:["gm4_update_message"],Duration:2000}
execute if score mysterious_midnights gm4_modules matches ..4 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Mysterious Midnights\"",Tags:["gm4_update_message"],Duration:2000}
execute if score note_block_interface gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Note Block Interface\"",Tags:["gm4_update_message"],Duration:2000}
execute if score orbis gm4_modules matches ..0 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Orbis\"",Tags:["gm4_update_message"],Duration:2000}
execute if score orbis_pre_gen gm4_modules matches ..0 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Orbis Pre Gen\"",Tags:["gm4_update_message"],Duration:2000}
execute if score particles_pack gm4_modules matches ..2 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Particles Pack\"",Tags:["gm4_update_message"],Duration:2000}
execute if score phantom_scarecrows gm4_modules matches ..5 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Phantom Scarecrows\"",Tags:["gm4_update_message"],Duration:2000}
execute if score pig_tractors gm4_modules matches ..2 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Pig Tractors\"",Tags:["gm4_update_message"],Duration:2000}
execute if score poses_pack gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Poses Pack\"",Tags:["gm4_update_message"],Duration:2000}
execute if score potion_liquids gm4_modules matches ..0 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Potion Liquids\"",Tags:["gm4_update_message"],Duration:2000}
execute if score potion_swords gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Potion Swords\"",Tags:["gm4_update_message"],Duration:2000}
execute if score record_crafting gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Record Crafting\"",Tags:["gm4_update_message"],Duration:2000}
execute if score scuba_gear gm4_modules matches ..2 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Scuba Gear\"",Tags:["gm4_update_message"],Duration:2000}
execute if score shroomites gm4_modules matches ..5 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Shroomites\"",Tags:["gm4_update_message"],Duration:2000}
execute if score spawner_minecarts gm4_modules matches ..2 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Spawner Minecarts\"",Tags:["gm4_update_message"],Duration:2000}
execute if score speed_paths gm4_modules matches ..2 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Speed Paths\"",Tags:["gm4_update_message"],Duration:2000}
execute if score standard_crafting gm4_modules matches ..2 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Standard Crafting\"",Tags:["gm4_update_message"],Duration:2000}
execute if score sunken_treasure gm4_modules matches ..7 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Sunken Treasure\"",Tags:["gm4_update_message"],Duration:2000}
execute if score sweethearts gm4_modules matches ..0 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Sweethearts\"",Tags:["gm4_update_message"],Duration:2000}
execute if score tower_structures gm4_modules matches ..0 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Tower Structures\"",Tags:["gm4_update_message"],Duration:2000}
execute if score trapped_signs gm4_modules matches ..0 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Trapped Signs\"",Tags:["gm4_update_message"],Duration:2000}
execute if score undead_players gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Undead Players\"",Tags:["gm4_update_message"],Duration:2000}
execute if score vertical_rails gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Vertical Rails\"",Tags:["gm4_update_message"],Duration:2000}
execute if score weighted_armour gm4_modules matches ..0 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Weighted Armour\"",Tags:["gm4_update_message"],Duration:2000}
execute if score xp_storage gm4_modules matches ..0 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Xp Storage\"",Tags:["gm4_update_message"],Duration:2000}
execute if score zauber_cauldrons gm4_modules matches ..8 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Zauber Cauldrons\"",Tags:["gm4_update_message"],Duration:2000}
execute if score ziprails gm4_modules matches ..1 run summon minecraft:area_effect_cloud ~ ~ ~ {CustomName:"\"Ziprails\"",Tags:["gm4_update_message"],Duration:2000}

