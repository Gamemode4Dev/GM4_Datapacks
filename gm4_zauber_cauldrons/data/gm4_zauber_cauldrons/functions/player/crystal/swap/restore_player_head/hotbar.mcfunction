# replace firework star form of zauber crystal with player head form
# @s = player who moved a firework star form of a zauber crystal in(to) their inventory, excluding the offhand slot
# at @s
# run from gm4_zauber_cauldrons:player/crystal/swap/restore_player_head

execute if score $slot gm4_zc_data matches 0 run loot replace entity @s hotbar.0 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 1 run loot replace entity @s hotbar.1 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 2 run loot replace entity @s hotbar.2 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 3 run loot replace entity @s hotbar.3 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 4 run loot replace entity @s hotbar.4 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 5 run loot replace entity @s hotbar.5 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 6 run loot replace entity @s hotbar.6 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 7 run loot replace entity @s hotbar.7 1 loot gm4_zauber_cauldrons:technical/restore_crystal
execute if score $slot gm4_zc_data matches 8 run loot replace entity @s hotbar.8 1 loot gm4_zauber_cauldrons:technical/restore_crystal
