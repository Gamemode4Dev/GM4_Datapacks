# @s = player holding a wormhole_bottle in the mainhand
# at world spawn
# run from player/wormhole_targeting/read_target_coordinates

# copy mainhand wormhole x, y, z, and dimension to the temporary data storage
data modify storage gm4_zauber_cauldrons:temp/item/wormhole/destination tag set from entity @s SelectedItem.tag

# extract the x, y, z, and dimension into fake players to minimize use of @e[type=item]
execute store result score wormhole_x gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/item/wormhole/destination tag.gm4_zauber_cauldrons.cauldron_pos.x
execute store result score wormhole_y gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/item/wormhole/destination tag.gm4_zauber_cauldrons.cauldron_pos.y
execute store result score wormhole_z gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/item/wormhole/destination tag.gm4_zauber_cauldrons.cauldron_pos.z
execute store result score wormhole_d gm4_zc_data run data get storage gm4_zauber_cauldrons:temp/item/wormhole/destination tag.gm4_zauber_cauldrons.cauldron_pos.dimension

# set flag
scoreboard players set read_coordinates gm4_zc_data 1
