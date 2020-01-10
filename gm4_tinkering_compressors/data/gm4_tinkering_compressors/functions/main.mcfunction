
execute as @e[type=armor_stand,tag=gm4_tinkering_compressor] at @s run function gm4_tinkering_compressors:process

# Check for Tinker Shamir on a Compressor
scoreboard players reset item_on_compressor gm4_tc_data
execute as @e[type=item,nbt={Item:{Count:1b,id:"minecraft:player_head",tag:{gm4_metallurgy:{has_shamir:1b,stored_shamir:"tinker",ore_type:"thorium_brass"}}}}] at @s align xyz positioned ~0.5 ~-1 ~0.5 if block ~ ~0.5 ~ minecraft:dropper if block ~ ~2.5 ~ minecraft:piston[facing=down] if entity @e[type=armor_stand,tag=gm4_block_compressor,sort=nearest,limit=1,distance=..0.11] run function gm4_tinkering_compressors:create_check

schedule function gm4_tinkering_compressors:main 16t
