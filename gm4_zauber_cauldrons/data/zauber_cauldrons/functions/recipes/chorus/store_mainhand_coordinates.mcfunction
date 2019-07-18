# @s = player holding a wormhole_bottle in the mainhand
# at world spawn

#reset offhand dimension if there is no offhand wormhole, this is so that the
#presence of this score implies the presence of an offhand wormhole
execute if score store_offhand gm4_zc_data matches 0 run scoreboard players reset @s gm4_zc_warp_od

#create temporary wormhole data storage to minimize player serializations
execute unless score wormhole_data gm4_zc_data matches 1 store success score wormhole_data gm4_zc_data run summon item ~ -512 ~ {Item:{id:stone,Count:1b},Tags:[gm4_zc_wormhole_data]}

#copy mainhand wormhole x, y, z, and dimension to the temporary data storage tag
data modify entity @e[type=item,y=-512,dy=0,tag=gm4_zc_wormhole_data,limit=1] Item.tag set from entity @s SelectedItem.tag.gm4_zauber_cauldrons.cauldron_pos

#extract the x, y, z, and dimension into fake players to minimize use of @e[type=item]
execute as @e[type=item,y=-512,dy=0,tag=gm4_zc_wormhole_data,limit=1] run function zauber_cauldrons:recipes/chorus/extract_item_coordinates

#copy the x, y, z, and dimension into the player's relevant scores
scoreboard players operation @s gm4_zc_warp_mx = wormhole_x gm4_zc_data
scoreboard players operation @s gm4_zc_warp_my = wormhole_y gm4_zc_data
scoreboard players operation @s gm4_zc_warp_mz = wormhole_z gm4_zc_data
scoreboard players operation @s gm4_zc_warp_md = wormhole_d gm4_zc_data
