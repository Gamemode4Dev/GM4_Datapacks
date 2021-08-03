# @s = player breaking beehive
# at @s
# run from advancement break

advancement revoke @s only gm4_beehive_inspector:break

execute as @e[type=item,nbt={Item:{id:"minecraft:beehive"},Age:0s},sort=nearest,limit=1] run function gm4_beehive_inspector:inspect
