# converts a zauber crystal back into its player head form inside the player's inventory
# @s = player who has moved a zauber crystal (firework star form) into their inventory
# at @s
# run from advancement gm4_zauber_cauldrons:equipment/crystal/moved_out_of_offhand

# the following code is a modified implementation stolen from BPR's Hotswap Hotbars (PR #850)
advancement revoke @s only gm4_zauber_cauldrons:equipment/crystal/moved_out_of_offhand

# get item data
scoreboard players set $slot gm4_zc_data -1
data modify storage gm4_zauber_cauldrons:temp/item/crystal Inventory set from entity @s Inventory

# ignore offhand slot
data remove storage gm4_zauber_cauldrons:temp/item/crystal Inventory[{Slot:-106b}]

# get first potential crystal match and store its slot
execute store success score $item gm4_zc_data run data modify storage gm4_zauber_cauldrons:temp/item/crystal Item set from storage gm4_zauber_cauldrons:temp/item/crystal Inventory[{id:"minecraft:firework_star",tag:{gm4_zauber_cauldrons:{item:"crystal"}}}]
execute if score $item gm4_zc_data matches 1.. store result score $slot gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/item/crystal Item.Slot

# remove firework star specific data
data remove storage gm4_zauber_cauldrons:temp/item/crystal Item.tag.Explosion

# replace item
execute if score $slot gm4_zc_data matches 0..8 run function gm4_zauber_cauldrons:player/crystal/swap/restore_player_head/hotbar
execute if score $slot gm4_zc_data matches 9..17 run function gm4_zauber_cauldrons:player/crystal/swap/restore_player_head/inv_1
execute if score $slot gm4_zc_data matches 18..26 run function gm4_zauber_cauldrons:player/crystal/swap/restore_player_head/inv_2
execute if score $slot gm4_zc_data matches 27..35 run function gm4_zauber_cauldrons:player/crystal/swap/restore_player_head/inv_3

# clean up
data remove storage gm4_zauber_cauldrons:temp/item/crystal Item
data remove storage gm4_zauber_cauldrons:temp/item/crystal Inventory

# check if there is another crystal remaining (player could have picked up multiple in the same tick), if not ($slot=-1) clean up fake player and return
execute unless score $slot gm4_zc_data matches ..-1 run function gm4_zauber_cauldrons:player/crystal/swap/restore_player_head
execute if score $slot gm4_zc_data matches ..-1 run scoreboard players reset $slot gm4_zc_data
