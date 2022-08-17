# NOTE remove during 1.20 update: updates old machines to include a marker entity
execute as @e[type=armor_stand,tag=gm4_block_compressor] at @s run function gm4_block_compressors:upgrade_machine_stand
# process machine
execute as @e[type=marker,tag=gm4_block_compressor] at @s run function gm4_block_compressors:process

schedule function gm4_block_compressors:main 16t
