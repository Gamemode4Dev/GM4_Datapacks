# replace hotswapper item with hotswapper box
# @s = player who moved the item from the offhand to the inventory
# at @s
# run from gm4_hotswap_hotbars:swap/restore_box

execute if score $slot gm4_guide matches 27 run loot replace entity @s inventory.18 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 28 run loot replace entity @s inventory.19 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 29 run loot replace entity @s inventory.20 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 30 run loot replace entity @s inventory.21 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 31 run loot replace entity @s inventory.22 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 32 run loot replace entity @s inventory.23 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 33 run loot replace entity @s inventory.24 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 34 run loot replace entity @s inventory.25 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 35 run loot replace entity @s inventory.26 1 loot gm4_guidebook:guidebook_with_count
