# NOTE remove during 1.20 update: updates old machines to include a marker entity
execute as @e[type=armor_stand,tag=gm4_tinkering_compressor] at @s run function gm4_tinkering_compressors:upgrade_machine_stand
# process machine
execute as @e[type=marker,tag=gm4_tinkering_compressor] at @s run function gm4_tinkering_compressors:process

# copied code for metallurgy smooshing
execute as @e[type=item,tag=!gm4_ml_smooshed,nbt={Item:{Count:1b,tag:{gm4_metallurgy:{has_shamir:1b}}}}] at @s if block ~ ~-1 ~ #minecraft:anvil run function gm4_tinkering_compressors:smooshing/item_on_anvil

schedule function gm4_tinkering_compressors:main 16t
