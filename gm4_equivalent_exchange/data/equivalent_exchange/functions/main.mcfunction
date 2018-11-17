#crafter destruction
execute as @e[type=armor_stand,tag=gm4_alchemical_crafter] at @s unless block ~ ~ ~ dropper run function equivalent_exchange:block_handling/destroy

#crafter maintenance
execute as @e[tag=gm4_alchemical_crafter,type=armor_stand] run data merge entity @s {Fire:2000}

#recipes
execute as @e[tag=gm4_alchemical_crafter,type=armor_stand] at @s if block ~ ~ ~ dropper[triggered=false]{Items:[{}]} run function equivalent_exchange:recipe_validity_check

#fix broken transmutation stone item
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"0d867dc5-c2b3-460f-bbc6-8cbd4ae93a5f"}}}}] run data merge entity @s {Item:{tag:{gm4_transmutation_stone:1b,gm4_transmutation_charge:0b,gm4_transmutation_charged:0b,display:{Lore:["§7Charge: §80%§r"],Name:"{\"text\":\"Transmutation Stone\",\"italic\":false}"}}}}


#recharge stone
execute as @a[scores={gm4_ee_sneak=1..},level=19..,nbt={SelectedItem:{id:"minecraft:player_head",Count:1b,tag:{gm4_transmutation_stone:1b}}}] run function equivalent_exchange:recharge/recharge_hand
execute if entity @a[scores={gm4_ee_sneak=1..}] run scoreboard players set @a[scores={gm4_ee_sneak=1..}] gm4_ee_sneak -20

#remove charged creepers
execute if entity @e[type=creeper,tag=gm4_removePower] as @e[type=creeper,tag=gm4_removePower] run function equivalent_exchange:post_effects/remove_lightning