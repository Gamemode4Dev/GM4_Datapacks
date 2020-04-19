# @s = player holding a wormhole_bottle in the mainhand
# at world spawn

# reset offhand dimension if there is no offhand wormhole, this is so that the
# presence of this score implies the presence of an offhand wormhole
scoreboard players reset @s gm4_zc_warp_od

# copy mainhand wormhole x, y, z, and dimension to the temporary data storage
data modify storage gm4_zauber_cauldrons:wormhole_destination cauldron_pos set from entity @s SelectedItem.tag.gm4_zauber_cauldrons.cauldron_pos

# extract the x, y, z, and dimension into fake players to minimize use of @e[type=item]
execute store result score @s gm4_zc_warp_mx run data get storage gm4_zauber_cauldrons:wormhole_destination cauldron_pos.x
execute store result score @s gm4_zc_warp_my run data get storage gm4_zauber_cauldrons:wormhole_destination cauldron_pos.y
execute store result score @s gm4_zc_warp_mz run data get storage gm4_zauber_cauldrons:wormhole_destination cauldron_pos.z
execute store result score @s gm4_zc_warp_md run data get storage gm4_zauber_cauldrons:wormhole_destination cauldron_pos.dimension

# set flag
scoreboard players set stored_coordinates gm4_zc_data 1
