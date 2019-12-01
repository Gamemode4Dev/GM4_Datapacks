#ran by main
#@s is entity with gm4_chestpack score 0, gm4_shulker_box tag and not the gm4_failed and gm4_chestpack_processed tag and on a valid chest block
#at @s
particle minecraft:campfire_cosy_smoke ~ ~0.5 ~ 0.1 0.1 0.1 0 10 normal
playsound minecraft:block.anvil.place block @a ~ ~ ~ 1 0.5
tag @s add gm4_chestpack_failed