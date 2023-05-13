# prepare for item smooshing
execute if score found_item_on_anvil gm4_ml_data matches 1 as @e[type=item,tag=gm4_ml_on_anvil] at @s if block ~ ~ ~ minecraft:moving_piston align xyz if entity @e[type=item,dx=0,nbt=!{Item:{tag:{gm4_metallurgy:{has_shamir:1b}}}}] run function gm4_metallurgy:smooshing/prepare_transfer


# spiraculum
execute if entity @e[tag=gm4_in_spiraculum] as @a[tag=gm4_has_spiraculum] at @s run function gm4_spiraculum_shamir:spiral

# arborenda
execute as @a run function gm4_arborenda_shamir:player/check_for_axe

# hypexperia
execute if score $hypexperia_active gm4_ml_data matches 1 run function gm4_hypexperia_shamir:find_orbs

# vibro
execute as @a[gamemode=!spectator,tag=gm4_has_vibro,predicate=gm4_vibro_shamir:sneak_on_ground] at @s run function gm4_vibro_shamir:jump
scoreboard players reset @a[gamemode=!spectator,tag=gm4_has_vibro,predicate=!gm4_vibro_shamir:sneak_on_ground] gm4_vibro_sneak
scoreboard players reset @a gm4_vibro_fall
scoreboard players reset @a gm4_vibro_hurt
scoreboard players reset @a gm4_vibro_absorb

schedule function gm4_metallurgy:tick 1t
