# replace firework star form of zauber crystal with player head form
# @s = player who moved a firework star form of a zauber crystal in(to) their inventory, excluding the offhand slot
# at @s
# run from gm4_zauber_cauldrons:player/crystal/swap/restore_player_head

execute if score $slot gm4_zc_data matches 18 run loot replace entity @s inventory.9 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 19 run loot replace entity @s inventory.10 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 20 run loot replace entity @s inventory.11 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 21 run loot replace entity @s inventory.12 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 22 run loot replace entity @s inventory.13 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 23 run loot replace entity @s inventory.14 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 24 run loot replace entity @s inventory.15 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 25 run loot replace entity @s inventory.16 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 26 run loot replace entity @s inventory.17 1 loot gm4_zauber_cauldrons:technical/restore_crystal
