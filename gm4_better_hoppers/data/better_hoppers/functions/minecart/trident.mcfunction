#run from minecart/projectile_player
#@s = trident near hopper minecart with an empty slot, at ~-.5 ~-1.5 ~-.5 from @s

summon minecraft:item ~ ~ ~ {PickupDelay:32767,Item:{id:"minecraft:trident",Count:1b}}
data modify entity @e[dx=1, dy=1.5, dz=1, type=hopper_minecart, sort=nearest, limit=1, nbt={PickupDelay:32767,Item:{id:"minecraft:trident",Count:1b}}] Item set from entity @s Trident
kill @s