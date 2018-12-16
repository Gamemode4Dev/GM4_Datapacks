#@s boiling zauber cauldron with valid structure and item(s) inside.
#at @s
#ran from valid_structure

#branches off into different module components

#make items not pickupable when a player is looking at a cauldron
execute as @a[gamemode=!spectator,distance=..3] at @s anchored eyes positioned ^ ^ ^1.448 if block ~ ~ ~ cauldron align xyz positioned ~.5 ~.5 ~.5 if entity @e[type=area_effect_cloud,tag=gm4_zauber_cauldron,distance=..0.1] align xyz as @e[type=item,dx=0,dy=0,dz=0] run data merge entity @s {PickupDelay:18s}

#set recipe_success to 0
scoreboard players set recipe_success gm4_zc_data 0

#tier 4 potions
execute if score recipe_success gm4_zc_data matches 0 align xyz if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:prismarine_crystals",Count:1b}}] if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:golden_apple",Count:1b}}] run function zauber_cauldrons:recipes/potions/zauber_potions

#zauber armor
execute if score recipe_success gm4_zc_data matches 0 align xyz if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"enchanted_prismarine_shard"}},Count:1b}}] run function zauber_cauldrons:recipes/armor/zauber_armor

#zauber crystals
execute if score recipe_success gm4_zc_data matches 0 align xyz if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:sea_lantern",Count:1b}}] if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] run function zauber_cauldrons:recipes/crystals/zauber_crystals

#enchanted prismarine shard
execute if score recipe_success gm4_zc_data matches 0 align xyz if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:prismarine_shard",Count:1b}},nbt=!{Item:{tag:{gm4_zauber_cauldrons:{item:"enchanted_prismarine_shard"}}}}] at @s if entity @a[level=30..,distance=..2,limit=1,sort=nearest,gamemode=!spectator] run function zauber_cauldrons:recipes/precursors/prismarine_shard

#luck from flowers
execute if score recipe_success gm4_zc_data matches 0 align xyz if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:grass",Count:1b}}] if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{tag:{gm4_zauber_cauldrons:{item:"enchanted_prismarine_shard"}},Count:1b}}] run function zauber_cauldrons:recipes/flowers/check_poisonous_flowers


#reset fake players
scoreboard players reset recipe_success gm4_zc_data
