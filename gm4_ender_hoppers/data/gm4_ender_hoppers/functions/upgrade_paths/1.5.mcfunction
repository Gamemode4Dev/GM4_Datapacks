execute as @e[type=armor_stand,tag=gm4_ender_hopper_stand,tag=!gm4_machine_cart,scores={gm4_entity_version=1}] at @s run function gm4_ender_hoppers:upgrade_paths/1.5/block_upgrade
execute as @e[type=armor_stand,tag=gm4_ender_hopper_stand,tag=gm4_machine_cart,scores={gm4_entity_version=1}] on vehicle at @s run function gm4_ender_hoppers:upgrade_paths/1.5/minecart_upgrade
