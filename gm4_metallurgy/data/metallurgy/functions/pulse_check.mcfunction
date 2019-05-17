#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = metallurgy gm4_clock_tick run function metallurgy:main

#handle ore dropping
execute if score found_ore_radius gm4_ml_data matches 1 as @e[type=area_effect_cloud,tag=gm4_ore_radius] at @s run function metallurgy:blasting/drop_ores
execute if score found_primed_tnt gm4_ml_data matches 1 as @e[type=tnt,nbt={Fuse:1s}] at @s run function metallurgy:blasting/tnt

#prepare for item smooshing
execute if score found_item_on_anvil gm4_ml_data matches 1 as @e[type=item,tag=gm4_ml_on_anvil] at @s if block ~ ~ ~ minecraft:moving_piston align xyz if entity @e[type=item,dx=0,nbt=!{Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}}] run function metallurgy:smooshing/prepare_transfer

#spiraculum
execute if entity @e[tag=gm4_in_spiraculum] as @a[tag=gm4_has_spiraculum] at @s run function spiraculum_shamir:spiral

#arborenda
execute if score arborenda_active gm4_ml_data matches 1 run function arborenda_shamir:main

#hypexperia
execute if score hypexperia_active gm4_ml_data matches 1 run function hypexperia_shamir:find_orbs

#forterra
execute if score forterra_active gm4_ml_data matches 1 run function forterra_shamir:find_stone

#ender_bolt
execute as @a[gamemode=!spectator,scores={gm4_bolt_damage=1..},nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"ender_bolt"}}}}] at @s positioned ^ ^ ^2 as @e[distance=..2,nbt={DeathTime:0s},type=!player,type=!armor_stand,nbt=!{SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"ender_bolt"}}}}] run scoreboard players set @s gm4_bolt_time 20

#levity
execute if score levity_active gm4_ml_data matches 1 run function levity_shamir:find_floating_players

#conduction
execute if score conduction_raycast gm4_ml_data matches 1 as @e[type=area_effect_cloud,tag=gm4_conduction_raycast_point] run function conduction_shamir:raycast_strike/lightning_raycast
