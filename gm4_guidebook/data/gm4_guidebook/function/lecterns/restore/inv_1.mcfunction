# restores the guidebook to normal form
# @s = player who has moved a lectern book into their inventory
# located at @s
# run from gm4_guidebook:lecterns/restore/search

execute if score $slot gm4_guide matches 9 run loot replace entity @s inventory.0 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 10 run loot replace entity @s inventory.1 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 11 run loot replace entity @s inventory.2 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 12 run loot replace entity @s inventory.3 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 13 run loot replace entity @s inventory.4 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 14 run loot replace entity @s inventory.5 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 15 run loot replace entity @s inventory.6 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 16 run loot replace entity @s inventory.7 1 loot gm4_guidebook:technical/guidebook_with_count
execute if score $slot gm4_guide matches 17 run loot replace entity @s inventory.8 1 loot gm4_guidebook:technical/guidebook_with_count
