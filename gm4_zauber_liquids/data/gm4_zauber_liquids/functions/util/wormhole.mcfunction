#@s = living-base entity below wormhole potion tank
#run from zauber_liquids:util_below

# To work with non-player mobs, both versions require a change to @e from @a on line 14 of wormhole_targeting/set_dimension.mcfunction

# Set coords
scoreboard players operation $wormhole_x gm4_zc_data = @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank] gm4_zl_warp_cx
scoreboard players operation $wormhole_y gm4_zc_data = @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank] gm4_zl_warp_cy
scoreboard players operation $wormhole_z gm4_zc_data = @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank] gm4_zl_warp_cz
scoreboard players operation $wormhole_d gm4_zc_data = @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank] gm4_zl_warp_cd
scoreboard players set $read_coordinates gm4_zc_data 1
execute at @s run function gm4_zauber_cauldrons:player/wormhole_targeting/prepare_teleport

scoreboard players remove @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank] gm4_lt_value 1
playsound entity.player.swim block @a[distance=..8] ~ ~ ~ .5 1.5
