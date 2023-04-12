
particle rain ~ ~ ~ 0.25 0.25 0.25 0 8
scoreboard players remove $heal.rain_length gm4_hy_data 1
execute if score $heal.rain_length gm4_hy_data matches 1.. positioned ^ ^ ^0.25 run function gm4_hydromancy:spell_trident/heal/vfx/cloud_rain
