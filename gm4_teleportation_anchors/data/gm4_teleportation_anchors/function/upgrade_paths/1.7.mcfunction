# @s = player
# at @s
# run via upgrade paths util

execute as @e[type=minecraft:armor_stand,tag=gm4_teleportation_anchor_stand] at @s positioned ~ ~0.4 ~ \
  run function gm4_teleportation_anchors:upgrade_paths/1.7/create_item_display_anchor

execute as @e[type=minecraft:armor_stand,tag=gm4_teleportation_jammer_stand] at @s positioned ~ ~0.4 ~ \
  run function gm4_teleportation_anchors:upgrade_paths/1.7/create_item_display_jammer
