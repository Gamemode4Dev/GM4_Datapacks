# restores the guidebook to normal form
# @s = player who has moved a lectern book into their inventory
# located at @s
# run from gm4_guidebook:lecterns/restore/search

execute if score $slot gm4_guide matches 18 run loot replace entity @s inventory.9 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 19 run loot replace entity @s inventory.10 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 20 run loot replace entity @s inventory.11 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 21 run loot replace entity @s inventory.12 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 22 run loot replace entity @s inventory.13 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 23 run loot replace entity @s inventory.14 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 24 run loot replace entity @s inventory.15 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 25 run loot replace entity @s inventory.16 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 26 run loot replace entity @s inventory.17 1 loot gm4_guidebook:technical/guidebook_with_count
