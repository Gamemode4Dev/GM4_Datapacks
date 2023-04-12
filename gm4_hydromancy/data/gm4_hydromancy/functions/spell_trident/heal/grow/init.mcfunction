# find random column to grow in
# @s = growth marker
# at @s
# run from spell_trident/heal/process

# randomize rotation
execute store result score $yaw gm4_hy_data run data get entity @s UUID[0]
execute store result score $pitch gm4_hy_data run data get entity @s UUID[1]
scoreboard players operation $yaw gm4_hy_data %= #3600 gm4_hy_data
execute store result entity @s Rotation[0] float 0.1 run scoreboard players remove $yaw gm4_hy_data 1800
execute store result entity @s Rotation[1] float -0.1 run scoreboard players operation $pitch gm4_hy_data %= #900 gm4_hy_data

# find edge of area, then raycast down until growable block is found or goes out of range
scoreboard players set $heal.growth_done gm4_hy_data 0
execute at @s positioned ^ ^ ^8 run function gm4_hydromancy:spell_trident/heal/grow/raycast

kill @s
