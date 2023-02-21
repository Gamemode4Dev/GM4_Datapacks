# replace hotswapper item with hotswapper box
# @s = player who moved the item from the offhand to the inventory
# at @s
# run from gm4_hotswap_hotbars:swap/restore_box

execute if score $slot gm4_hh_data matches 0 run loot replace entity @s hotbar.0 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 1 run loot replace entity @s hotbar.1 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 2 run loot replace entity @s hotbar.2 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 3 run loot replace entity @s hotbar.3 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 4 run loot replace entity @s hotbar.4 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 5 run loot replace entity @s hotbar.5 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 6 run loot replace entity @s hotbar.6 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 7 run loot replace entity @s hotbar.7 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
execute if score $slot gm4_hh_data matches 8 run loot replace entity @s hotbar.8 1 loot gm4_hotswap_hotbars:technical/restore_hotswapper
