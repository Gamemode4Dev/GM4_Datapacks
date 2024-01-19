# replace firework star form of zauber crystal with player head form
# @s = player who moved a firework star form of a zauber crystal in(to) their inventory, excluding the offhand slot
# at @s
# run from gm4_zauber_cauldrons:player/crystal/swap/restore_player_head

execute if score $slot gm4_zc_data matches 27 run loot replace entity @s inventory.18 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 28 run loot replace entity @s inventory.19 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 29 run loot replace entity @s inventory.20 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 30 run loot replace entity @s inventory.21 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 31 run loot replace entity @s inventory.22 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 32 run loot replace entity @s inventory.23 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 33 run loot replace entity @s inventory.24 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 34 run loot replace entity @s inventory.25 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 35 run loot replace entity @s inventory.26 1 loot gm4_zauber_cauldrons:technical/restore_crystal
