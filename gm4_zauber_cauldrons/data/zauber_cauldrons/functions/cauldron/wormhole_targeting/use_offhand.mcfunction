# @s = player consuming wormhole_bottle from offhand
# at @s
# run from cauldron/wormhole_targeting/choose_dimension

scoreboard players operation wormhole_x gm4_zc_data = @s gm4_zc_warp_ox
scoreboard players operation wormhole_y gm4_zc_data = @s gm4_zc_warp_oy
scoreboard players operation wormhole_z gm4_zc_data = @s gm4_zc_warp_oz
scoreboard players operation wormhole_d gm4_zc_data = @s gm4_zc_warp_od