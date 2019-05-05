# @s = player holding a wormhole_bottle either in the offhand OR (exclusive) in the mainhand
# at world spawn

#store coordinates from item into scoreboard
execute store result score @s gm4_zc_warp_x run data get entity @s SelectedItem.tag.gm4_zauber_cauldrons.cauldron_pos.x
execute store result score @s gm4_zc_warp_y run data get entity @s SelectedItem.tag.gm4_zauber_cauldrons.cauldron_pos.y
execute store result score @s gm4_zc_warp_z run data get entity @s SelectedItem.tag.gm4_zauber_cauldrons.cauldron_pos.z
execute store result score @s gm4_zc_warp_d run data get entity @s SelectedItem.tag.gm4_zauber_cauldrons.cauldron_pos.dimension
