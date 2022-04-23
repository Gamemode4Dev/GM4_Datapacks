# NOTE remove during 1.20 update: updates old machines to include a marker entity
execute as @e[type=armor_stand,tag=gm4_ender_hopper] at @s run function gm4_ender_hoppers:upgrade_machine_stand
execute as @e[type=armor_stand,tag=gm4_ender_hoppers_display] at @s run function gm4_ender_hoppers:upgrade_machine_cart_stand
# process machine
execute as @e[type=marker,tag=gm4_ender_hopper] at @s run function gm4_ender_hoppers:process
execute as @e[type=hopper_minecart,tag=gm4_ender_hopper_minecart] at @s run function gm4_ender_hoppers:process_cart


schedule function gm4_ender_hoppers:main 16t
