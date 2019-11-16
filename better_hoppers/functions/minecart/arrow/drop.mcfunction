#run from minecart/arrow or minecart/arrow/full
#@s is arrow with hopper minecart near it, at ~-.5 ~-1.5 ~-.5 from @s

execute at @e[dx=1, dy=1.5, dz=1, type=hopper_minecart, nbt={Enabled:1b}, sort=nearest, limit=1] run summon minecraft:item ~ ~ ~ {PickupDelay:32767,Item:{id:"minecraft:arrow",Count:1b}}
kill @s