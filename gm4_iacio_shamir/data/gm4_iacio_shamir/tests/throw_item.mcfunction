# @template gm4_iacio_shamir:test_long_platform
# @dummy ~ ~1 ~1

execute at @s run tp @s ~ ~ ~ 270 0

item replace entity @s weapon.mainhand with minecraft:iron_ingot
await delay 1t
dummy @s drop

await items entity @e[type=item,dx=12,dy=2,dz=2,distance=3..5,nbt={OnGround:1b}] contents minecraft:iron_ingot

item replace entity @s armor.chest with minecraft:iron_chestplate[custom_data={gm4_metallurgy:{has_shamir:1b,active_shamir:"iacio"}}]

await delay 1t

item replace entity @s weapon.mainhand with minecraft:gold_ingot
await delay 1t
dummy @s drop

await items entity @e[type=item,dx=12,dy=2,dz=2,distance=6..,nbt={OnGround:1b}] contents minecraft:gold_ingot
