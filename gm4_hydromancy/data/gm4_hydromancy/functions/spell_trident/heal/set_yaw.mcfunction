# set yaw of trident that landed into the side of a block
# @s = spell trident
# at @s
# run from spell_trident/heal/landed

data modify entity @s Rotation[1] set value -80F
execute if score $yaw gm4_hy_data matches 1 run data modify entity @s Rotation[0] set value 0F
execute if score $yaw gm4_hy_data matches 2 run data modify entity @s Rotation[0] set value 90F
execute if score $yaw gm4_hy_data matches 3 run data modify entity @s Rotation[0] set value 45F
execute if score $yaw gm4_hy_data matches 4 run data modify entity @s Rotation[0] set value 270F
execute if score $yaw gm4_hy_data matches 5 run data modify entity @s Rotation[0] set value 315F
execute if score $yaw gm4_hy_data matches 6 run data modify entity @s Rotation[0] set value 180F
execute if score $yaw gm4_hy_data matches 8 run data modify entity @s Rotation[0] set value 135F
execute if score $yaw gm4_hy_data matches 10 run data modify entity @s Rotation[0] set value 225F
