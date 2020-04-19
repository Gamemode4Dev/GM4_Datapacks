# @s = player holding a wormhole_bottle in the offhand
# at world spawn

# reset mainhand dimension if there is no mainhand wormhole, this is so that the
# presence of this score implies the presence of an mainhand wormhole
scoreboard players reset @s gm4_zc_warp_md

# copy mainhand wormhole x, y, z, and dimension to the temporary data storage
data modify storage gm4_zauber_cauldrons:temp/item/wormhole/destination cauldron_pos set from entity @s Inventory[-1].tag.gm4_zauber_cauldrons.cauldron_pos

# extract the x, y, z, and dimension into fake players to minimize use of @e[type=item]
execute store result score @s gm4_zc_warp_ox run data get storage gm4_zauber_cauldrons:temp/item/wormhole/destination cauldron_pos.x
execute store result score @s gm4_zc_warp_oy run data get storage gm4_zauber_cauldrons:temp/item/wormhole/destination cauldron_pos.y
execute store result score @s gm4_zc_warp_oz run data get storage gm4_zauber_cauldrons:temp/item/wormhole/destination cauldron_pos.z
execute store result score @s gm4_zc_warp_od run data get storage gm4_zauber_cauldrons:temp/item/wormhole/destination cauldron_pos.dimension
