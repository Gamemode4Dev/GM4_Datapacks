#run from metallurgy:main

execute at @a[nbt={Inventory:[{Slot:103b,tag:{gm4_metallurgy:{active_shamir:"defuse"}}}]}] as @e[type=creeper,distance=..6] run data merge entity @s {Fuse:32767s,ExplosionRadius:0}
execute at @a[nbt={Inventory:[{Slot:102b,tag:{gm4_metallurgy:{active_shamir:"defuse"}}}]}] as @e[type=creeper,distance=..6] run data merge entity @s {Fuse:32767s,ExplosionRadius:0}
execute at @a[nbt={Inventory:[{Slot:101b,tag:{gm4_metallurgy:{active_shamir:"defuse"}}}]}] as @e[type=creeper,distance=..6] run data merge entity @s {Fuse:32767s,ExplosionRadius:0}
execute at @a[nbt={Inventory:[{Slot:100b,tag:{gm4_metallurgy:{active_shamir:"defuse"}}}]}] as @e[type=creeper,distance=..6] run data merge entity @s {Fuse:32767s,ExplosionRadius:0}
