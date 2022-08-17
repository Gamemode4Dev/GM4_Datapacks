# NOTE remove during 1.20 update: updates old machines to include a marker entity
execute as @e[type=armor_stand,tag=gm4_trapped_sign] at @s run function gm4_trapped_signs:upgrade_machine_stand
# process trapped signs
execute as @e[type=marker,tag=gm4_trapped_sign] at @s run function gm4_trapped_signs:process

schedule function gm4_trapped_signs:main 1t
