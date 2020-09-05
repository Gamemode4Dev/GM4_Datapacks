# math for averages: x,y,z: (oldcoord + ((newcoord-oldcoord)/(newfullness)))| dimension: olddim
execute store result score @s gm4_zc_warp_mx run data get block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.cauldron_pos.x
execute store result score @s gm4_zc_warp_my run data get block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.cauldron_pos.y
execute store result score @s gm4_zc_warp_mz run data get block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.cauldron_pos.z
execute store result score @s gm4_zc_warp_md run data get block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.cauldron_pos.dimension
scoreboard players add @s gm4_lt_value 1

# x math
scoreboard players operation @s gm4_zc_warp_mx -= @s gm4_zc_warp_ox
scoreboard players operation @s gm4_zc_warp_mx /= @s gm4_lt_value
scoreboard players operation @s gm4_zc_warp_ox += @s gm4_zc_warp_mx
# y math
scoreboard players operation @s gm4_zc_warp_my -= @s gm4_zc_warp_oy
scoreboard players operation @s gm4_zc_warp_my /= @s gm4_lt_value
scoreboard players operation @s gm4_zc_warp_oy += @s gm4_zc_warp_my
# z math
scoreboard players operation @s gm4_zc_warp_mz -= @s gm4_zc_warp_oz
scoreboard players operation @s gm4_zc_warp_mz /= @s gm4_lt_value
scoreboard players operation @s gm4_zc_warp_oz += @s gm4_zc_warp_mz
# set dimension if first wormhole
execute if score @s gm4_lt_value matches 1 run scoreboard players operation @s gm4_zc_warp_od = @s gm4_zc_warp_md

execute if data block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.bottle.multi_use run function gm4_zauber_liquids:item_drain/update_sips
execute unless data block ~ ~ ~ Items[{Slot: 0b}].tag.gm4_zauber_cauldrons.bottle.multi_use run replaceitem block ~ ~ ~ container.0 glass_bottle 1
tag @s add gm4_lt_drain
