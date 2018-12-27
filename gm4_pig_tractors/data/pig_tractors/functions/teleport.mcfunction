# Called from destroy
# @s = item near the pig tractor that just harvested
# at pig tractor that called this function
execute if entity @s[nbt={Item:{id:"minecraft:beetroot"}}] run data merge entity @s {PickupDelay:0s,Tags:["gm4_crop_tp"]}
execute if entity @s[nbt={Item:{id:"minecraft:beetroot_seeds"}}] run data merge entity @s {PickupDelay:0s,Tags:["gm4_crop_tp"]}
execute if entity @s[nbt={Item:{id:"minecraft:potato"}}] run data merge entity @s {PickupDelay:0s,Tags:["gm4_crop_tp"]}
execute if entity @s[nbt={Item:{id:"minecraft:carrot"}}] run data merge entity @s {PickupDelay:0s,Tags:["gm4_crop_tp"]}
execute if entity @s[nbt={Item:{id:"minecraft:wheat"}}] run data merge entity @s {PickupDelay:0s,Tags:["gm4_crop_tp"]}
execute if entity @s[nbt={Item:{id:"minecraft:wheat_seeds"}}] run data merge entity @s {PickupDelay:0s,Tags:["gm4_crop_tp"]}
execute if entity @s[nbt={Item:{id:"minecraft:poisonous_potato"}}] run data merge entity @s {PickupDelay:0s,Tags:["gm4_crop_tp"]}
tp @s[tag=gm4_crop_tp] @p[tag=gm4_harvested]
data merge entity @s {Motion:[0.0,0.0,0.0]}
