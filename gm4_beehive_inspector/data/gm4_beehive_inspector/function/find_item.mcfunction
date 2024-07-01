# @s = player breaking beehive or bee_nest
# at @s
# run from advancement break

advancement revoke @s only gm4_beehive_inspector:break

execute as @e[type=item,nbt={Age:0s},distance=..6,sort=furthest,limit=1] at @s run function gm4_beehive_inspector:inspect
