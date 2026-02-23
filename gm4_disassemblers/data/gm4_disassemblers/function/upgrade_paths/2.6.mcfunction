# @s = player
# at @s
# run via upgrade paths util

execute as @e[type=armor_stand,tag=gm4_disassembler_stand] at @s positioned ~ ~0.4 ~ \
  run function gm4_disassemblers:upgrade_paths/2.6/item_display
