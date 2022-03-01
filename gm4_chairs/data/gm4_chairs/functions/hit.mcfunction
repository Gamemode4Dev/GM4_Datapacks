# Find pig/chair that has just been hit
# @s = player hitting the chair
# at @s
# run from advancement hit

advancement revoke @s only gm4_chairs:hit

execute as @e[type=minecraft:pig,tag=gm4_chairs,nbt={HurtTime:10s}] at @s positioned ^ ^.9 ^.2 run function gm4_chairs:kill
