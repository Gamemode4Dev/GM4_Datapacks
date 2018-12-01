#crafter destruction
execute as @e[type=armor_stand,tag=gm4_alchemical_crafter] at @s unless block ~ ~ ~ dropper run function equivalent_exchange:block_handling/destroy

#crafter maintenance
execute as @e[tag=gm4_alchemical_crafter,type=armor_stand] run data merge entity @s {Fire:2000}

execute as @e[type=item,nbt={Item:{Count:1b,tag:{gm4_transmutation_stone:1b}}}] at @s if block ~ ~ ~ cauldron unless block ~ ~ ~ cauldron[level=0] if block ~1 ~-1 ~ lapis_block if block ~-1 ~-1 ~ lapis_block if block ~ ~-1 ~1 lapis_block if block ~ ~-1 ~-1 lapis_block if block ~1 ~-1 ~1 lapis_block if block ~1 ~-1 ~-1 lapis_block if block ~-1 ~-1 ~1 lapis_block if block ~-1 ~-1 ~-1 lapis_block if block ~ ~-1 ~ lapis_block if block ~1 ~ ~ quartz_slab if block ~-1 ~ ~ quartz_slab if block ~ ~ ~1 quartz_slab if block ~ ~ ~-1 quartz_slab if block ~2 ~-1 ~ quartz_stairs[facing=west] if block ~-2 ~-1 ~ quartz_stairs[facing=east] if block ~ ~-1 ~2 quartz_stairs[facing=north] if block ~ ~-1 ~-2 quartz_stairs[facing=south] run function equivalent_exchange:block_handling/recharge_cauldron

#recipes
execute as @e[tag=gm4_alchemical_crafter,type=armor_stand] at @s if block ~ ~ ~ dropper[triggered=false]{Items:[{}]} run function equivalent_exchange:recipe_validity_check

#fix broken transmutation stone item
execute as @e[type=item,nbt={Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:"0d867dc5-c2b3-460f-bbc6-8cbd4ae93a5f"}}}}] unless entity @s[nbt={Item:{tag:{gm4_transmutation_stone:1b}}}] run data merge entity @s {Item:{tag:{gm4_transmutation_stone:1b,gm4_transmutation_charge:0s,display:{Name:"{\"text\":\"Transmutation Stone\",\"italic\":false}"}}}}

#display charge
execute as @a[nbt={SelectedItem:{id:"minecraft:player_head",tag:{gm4_transmutation_stone:1b}}}] run function equivalent_exchange:block_handling/display_charge
execute as @e[tag=gm4_alchemical_crafter] at @s if block ~ ~ ~ dropper{Items:[{Slot:0b,tag:{gm4_transmutation_stone:1b}}]} as @a[distance=..5] at @s run function equivalent_exchange:block_handling/charge_report_ray

#move decorative particles
execute as @e[tag=gm4_ee_decorative_particle] at @s run function equivalent_exchange:recharge/move_decorative_particle

#remove charged creepers
execute if entity @e[type=creeper,tag=gm4_removePower] as @e[type=creeper,tag=gm4_removePower] run function equivalent_exchange:post_effects/remove_lightning

#player curse
execute as @a[scores={gm4_ee_curse=1..}] run function equivalent_exchange:post_effects/curse_player

#reset stat scores
execute if entity @a[scores={gm4_ee_sneak=1..}] run scoreboard players set @a[scores={gm4_ee_sneak=1..}] gm4_ee_sneak -10