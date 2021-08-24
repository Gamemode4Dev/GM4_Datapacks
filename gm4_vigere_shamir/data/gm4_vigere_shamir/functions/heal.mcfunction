# Heals the player for 1.5 hearts after blocking with a Vigere Shield
# at @s, player blocking with a Vigere Shield
# runs from gm4_vigere_shamir:main

execute store result score $remove_health gm4_ml_data run attribute @s minecraft:generic.max_health get
scoreboard players operation $remove_health gm4_ml_data -= @s gm4_health

# lower player's max health to their current health
execute if score $remove_health gm4_ml_data matches 512.. run attribute @s minecraft:generic.max_health modifier add e0c18b32-4caf-4193-8899-74ad1cc0dba2 gm4_vigere_remove_512 -512 add
execute if score $remove_health gm4_ml_data matches 512.. run scoreboard players remove $remove_health gm4_ml_data 512
execute if score $remove_health gm4_ml_data matches 256.. run attribute @s minecraft:generic.max_health modifier add f7676355-5de1-4167-9c01-2a274b5ee6bc gm4_vigere_remove_256 -256 add
execute if score $remove_health gm4_ml_data matches 256.. run scoreboard players remove $remove_health gm4_ml_data 256
execute if score $remove_health gm4_ml_data matches 128.. run attribute @s minecraft:generic.max_health modifier add 2df88b31-a47f-4c31-a5b8-aa51ed1c35bb gm4_vigere_remove_128 -128 add
execute if score $remove_health gm4_ml_data matches 128.. run scoreboard players remove $remove_health gm4_ml_data 128
execute if score $remove_health gm4_ml_data matches 64.. run attribute @s minecraft:generic.max_health modifier add 41fd129e-322f-4147-b2fa-8185206f5b8e gm4_vigere_remove_64 -64 add
execute if score $remove_health gm4_ml_data matches 64.. run scoreboard players remove $remove_health gm4_ml_data 64
execute if score $remove_health gm4_ml_data matches 32.. run attribute @s minecraft:generic.max_health modifier add 1afb3106-b947-46ca-942a-cad1a78f5df7 gm4_vigere_remove_32 -32 add
execute if score $remove_health gm4_ml_data matches 32.. run scoreboard players remove $remove_health gm4_ml_data 32
execute if score $remove_health gm4_ml_data matches 16.. run attribute @s minecraft:generic.max_health modifier add 04f2b196-ca85-4ac8-b8e0-a7d569b415c8 gm4_vigere_remove_16 -16 add
execute if score $remove_health gm4_ml_data matches 16.. run scoreboard players remove $remove_health gm4_ml_data 16
execute if score $remove_health gm4_ml_data matches 8.. run attribute @s minecraft:generic.max_health modifier add 1f624b8a-89a4-4951-b4ce-f21890adbf89 gm4_vigere_remove_8 -8 add
execute if score $remove_health gm4_ml_data matches 8.. run scoreboard players remove $remove_health gm4_ml_data 8
execute if score $remove_health gm4_ml_data matches 4.. run attribute @s minecraft:generic.max_health modifier add 52b90103-a8c1-40a1-b2dd-9e7feb978b52 gm4_vigere_remove_4 -4 add
execute if score $remove_health gm4_ml_data matches 4.. run scoreboard players remove $remove_health gm4_ml_data 4
execute if score $remove_health gm4_ml_data matches 2.. run attribute @s minecraft:generic.max_health modifier add c875bec0-f7e4-4479-a030-dc92eb39d29a gm4_vigere_remove_2 -2 add
execute if score $remove_health gm4_ml_data matches 2.. run scoreboard players remove $remove_health gm4_ml_data 2
execute if score $remove_health gm4_ml_data matches 1.. run attribute @s minecraft:generic.max_health modifier add 41b9fe4f-ce8e-4025-8215-d47f9321b853 gm4_vigere_remove_1 -1 add
execute if score $remove_health gm4_ml_data matches 1.. run scoreboard players remove $remove_health gm4_ml_data 1

# heal player
attribute @s minecraft:generic.max_health modifier add f32329fb-6205-4eda-9db8-9f9ccc85605f gm4_vigere_heal 3 add
effect give @s minecraft:instant_health 1 0 true

# revert max health
tag @s add gm4_vs_healed
scoreboard players reset $remove_health gm4_ml_data

# visuals
execute anchored eyes run particle minecraft:heart ^ ^-.2 ^.7 .2 .1 .2 1 3 normal
playsound minecraft:block.brewing_stand.brew player @s ~ ~ ~ 0.3 0.8

# debuff
effect give @s minecraft:mining_fatigue 3 5 true
execute store success score $in_mainhand gm4_ml_data if predicate gm4_vigere_shamir:vigere_in_mainhand run item modify entity @s weapon.mainhand gm4_vigere_shamir:use_durability_mainhand
execute unless score $in_mainhand gm4_ml_data matches 1.. run item modify entity @s weapon.offhand gm4_vigere_shamir:use_durability_offhand
scoreboard players reset $in_mainhand gm4_ml_data
