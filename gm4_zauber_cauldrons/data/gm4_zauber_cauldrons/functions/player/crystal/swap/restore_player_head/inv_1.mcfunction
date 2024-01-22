# replace firework star form of zauber crystal with player head form
# @s = player who moved a firework star form of a zauber crystal in(to) their inventory, excluding the offhand slot
# at @s
# run from gm4_zauber_cauldrons:player/crystal/swap/restore_player_head

execute if score $slot gm4_zc_data matches 9 run loot replace entity @s inventory.0 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 10 run loot replace entity @s inventory.1 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 11 run loot replace entity @s inventory.2 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 12 run loot replace entity @s inventory.3 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 13 run loot replace entity @s inventory.4 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 14 run loot replace entity @s inventory.5 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 15 run loot replace entity @s inventory.6 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 16 run loot replace entity @s inventory.7 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 17 run loot replace entity @s inventory.8 1 loot gm4_zauber_cauldrons:technical/restore_crystal
