# @template gm4_iacio_shamir:test_long_platform
# @dummy ~ ~1 ~1

execute at @s run tp @s ~ ~ ~ 270 0

give @s iron_ingot
await delay 1t
dummy @s drop

await entity @e[type=item,dx=12,dy=2,dz=2,distance=3..5,nbt={OnGround:1b,Item:{id:"minecraft:iron_ingot"}}]

give @s iron_chestplate{gm4_metallurgy:{has_shamir:1b,active_shamir:"iacio"}}
dummy @s use item

await delay 1t

give @s gold_ingot
await delay 1t
dummy @s drop

await entity @e[type=item,dx=12,dy=2,dz=2,distance=6..,nbt={OnGround:1b,Item:{id:"minecraft:gold_ingot"}}]
