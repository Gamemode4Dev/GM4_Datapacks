# replace hotswapper item with hotswapper box
# @s = player who moved the item from the offhand to the inventory
# at @s
# run from gm4_hotswap_hotbars:swap/restore_box

execute if score $slot gm4_hh_data matches 18 run loot replace entity @s inventory.9 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 19 run loot replace entity @s inventory.10 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 20 run loot replace entity @s inventory.11 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 21 run loot replace entity @s inventory.12 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 22 run loot replace entity @s inventory.13 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 23 run loot replace entity @s inventory.14 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 24 run loot replace entity @s inventory.15 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 25 run loot replace entity @s inventory.16 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 26 run loot replace entity @s inventory.17 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
