# run from gm4_zauber_liquids:item_drain
# @s = tank being processed

# Non-Weighted Averages: (oldcoord+newcoord)/2
execute store result score $math gm4_zl_warp_cx run data get storage gm4_liquid_tanks:temp/tank input_slot.tag.gm4_zauber_cauldrons.cauldron_pos.x
execute store result score $math gm4_zl_warp_cy run data get storage gm4_liquid_tanks:temp/tank input_slot.tag.gm4_zauber_cauldrons.cauldron_pos.y
execute store result score $math gm4_zl_warp_cz run data get storage gm4_liquid_tanks:temp/tank input_slot.tag.gm4_zauber_cauldrons.cauldron_pos.z
execute store result score $math gm4_zl_warp_cd run data get storage gm4_liquid_tanks:temp/tank input_slot.tag.gm4_zauber_cauldrons.cauldron_pos.dimension
# Double score for first one so the initail input is just the actual position
execute if score @s gm4_lt_value matches 0 run scoreboard players operation $math gm4_zl_warp_cx += $math gm4_zl_warp_cx
execute if score @s gm4_lt_value matches 0 run scoreboard players operation $math gm4_zl_warp_cy += $math gm4_zl_warp_cy
execute if score @s gm4_lt_value matches 0 run scoreboard players operation $math gm4_zl_warp_cz += $math gm4_zl_warp_cz


# x math
scoreboard players operation @s gm4_zl_warp_cx += $math gm4_zl_warp_cx
scoreboard players operation @s gm4_zl_warp_cx /= #2 gm4_lt_value

# # y math
scoreboard players operation @s gm4_zl_warp_cy += $math gm4_zl_warp_cy
scoreboard players operation @s gm4_zl_warp_cy /= #2 gm4_lt_value

# # z math
scoreboard players operation @s gm4_zl_warp_cz += $math gm4_zl_warp_cz
scoreboard players operation @s gm4_zl_warp_cz /= #2 gm4_lt_value

# set dimension if first wormhole
execute if score @s gm4_lt_value matches 0 run scoreboard players operation @s gm4_zl_warp_cd = $math gm4_zl_warp_cd

function gm4_zauber_liquids:item_drain/zauber_potion
