# run via upgrade paths util

execute as @e[type=minecraft:armor_stand,tag=gm4_smeltery_stand] at @s positioned ~ ~0.3 ~ \
  run function gm4_smelteries:upgrade_paths/1.9/smeltery_item_display

execute as @e[type=minecraft:armor_stand,tag=gm4_smeltery_cauldron] at @s positioned ^ ^1.5 ^1 \
  run function gm4_smelteries:upgrade_paths/1.9/cauldron_item_display
