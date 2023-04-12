
data modify entity @s Rotation[0] set from storage gm4_hydromancy:temp Rotation

scoreboard players set $firework.particle_ring_length gm4_hy_data 50
scoreboard players set $firework.particle_ring_rot gm4_hy_data 36

execute at @s rotated ~90 ~ run function gm4_hydromancy:spell_trident/firework/particles/ring_rot

kill @s
