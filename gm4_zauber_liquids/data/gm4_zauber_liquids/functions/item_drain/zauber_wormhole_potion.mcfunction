# math for averages: x,y,z: (oldcoord + ((newcoord-oldcoord)/(newfullness)))| dimension: olddim
execute store result score math gm4_zl_warp_cx run data get block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.cauldron_pos.x
execute store result score math gm4_zl_warp_cy run data get block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.cauldron_pos.y
execute store result score math gm4_zl_warp_cz run data get block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.cauldron_pos.z
execute store result score math gm4_zl_warp_cd run data get block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.cauldron_pos.dimension

execute if score @s gm4_lt_value matches 1 run scoreboard players operation math gm4_zl_warp_cx += math gm4_zl_warp_cx
execute if score @s gm4_lt_value matches 1 run scoreboard players operation math gm4_zl_warp_cy += math gm4_zl_warp_cy
execute if score @s gm4_lt_value matches 1 run scoreboard players operation math gm4_zl_warp_cz += math gm4_zl_warp_cz


# x math
scoreboard players operation @s gm4_zl_warp_cx += math gm4_zl_warp_cx
scoreboard players operation @s gm4_zl_warp_cx /= divisor gm4_zl_warp_cx

# # y math
scoreboard players operation @s gm4_zl_warp_cy += math gm4_zl_warp_cy
scoreboard players operation @s gm4_zl_warp_cy /= divisor gm4_zl_warp_cx

# # z math
scoreboard players operation @s gm4_zl_warp_cz += math gm4_zl_warp_cz
scoreboard players operation @s gm4_zl_warp_cz /= divisor gm4_zl_warp_cx

# set dimension if first wormhole
execute if score @s gm4_lt_value matches 1 run scoreboard players operation @s gm4_zl_warp_cd = math gm4_zl_warp_cd

execute if data block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.bottle.multi_use run function gm4_zauber_liquids:item_drain/update_sips
execute unless data block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.bottle.multi_use run replaceitem block ~ ~ ~ container.0 glass_bottle 1
tag @s add gm4_lt_drain
