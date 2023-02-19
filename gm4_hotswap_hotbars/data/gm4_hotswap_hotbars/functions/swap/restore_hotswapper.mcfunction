# restores the hotswapper custom data
# @s = player who has a hotswapper named shulker box without proper data in their main or offhand
# at @s
# run from advancement "gm4_hotswap_hotbars:moved_shulker_box"

advancement revoke @s only gm4_hotswap_hotbars:moved_shulker_box
item modify entity @s[predicate=gm4_hotswap_hotbars:shulker_box_offhand] weapon.offhand gm4_hotswap_hotbars:restore_hotswapper
item modify entity @s[predicate=gm4_hotswap_hotbars:shulker_box_mainhand] weapon.mainhand gm4_hotswap_hotbars:restore_hotswapper
