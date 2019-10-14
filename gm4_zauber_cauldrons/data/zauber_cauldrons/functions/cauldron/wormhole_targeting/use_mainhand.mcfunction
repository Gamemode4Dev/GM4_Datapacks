# @s = player consuming wormhole_bottle from mainhand
# at @s
# run from cauldron/wormhole_targeting/choose_dimension

scoreboard players operation wormhole_x gm4_zc_data = @s gm4_zc_warp_mx
scoreboard players operation wormhole_y gm4_zc_data = @s gm4_zc_warp_my
scoreboard players operation wormhole_z gm4_zc_data = @s gm4_zc_warp_mz
scoreboard players operation wormhole_d gm4_zc_data = @s gm4_zc_warp_md
