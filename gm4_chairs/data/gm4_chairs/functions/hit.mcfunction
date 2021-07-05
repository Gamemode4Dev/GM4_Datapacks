#run from advancement hit
# @s = player hitting the chair

advancement revoke @s only gm4_chairs:hit

execute as @e[type=minecraft:pig,tag=gm4_chairs,nbt={HurtTime:10s}] at @s positioned ^ ^.9 ^.2 run function gm4_chairs:kill
