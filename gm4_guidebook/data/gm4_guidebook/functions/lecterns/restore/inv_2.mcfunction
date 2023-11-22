# replace hotswapper item with hotswapper box
# @s = player who moved the item from the offhand to the inventory
# at @s
# run from gm4_hotswap_hotbars:swap/restore_box

execute if score $slot gm4_guide matches 18 run loot replace entity @s inventory.9 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 19 run loot replace entity @s inventory.10 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 20 run loot replace entity @s inventory.11 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 21 run loot replace entity @s inventory.12 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 22 run loot replace entity @s inventory.13 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 23 run loot replace entity @s inventory.14 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 24 run loot replace entity @s inventory.15 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 25 run loot replace entity @s inventory.16 1 loot gm4_guidebook:guidebook_with_count
execute if score $slot gm4_guide matches 26 run loot replace entity @s inventory.17 1 loot gm4_guidebook:guidebook_with_count
