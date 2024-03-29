# @template gm4_metallurgy:test_smooshing
# @dummy ~0.5 ~4 ~1.5
# @optional

execute at @s run tp @s ~ ~ ~ 270 50

summon item ~1.5 ~2.5 ~1.5 {Item:{id:"minecraft:bucket",Count:1b}}
loot spawn ~1.5 ~2.5 ~1.5 loot gm4_infinitas_shamir:band

await delay 1s

setblock ~1 ~4 ~1 redstone_block

await entity @e[type=item,distance=..6,nbt={Item:{id:"minecraft:obsidian"}}]

# equip smooshed infinitas bucket
summon armor_stand ~2.5 ~4 ~1.5 {Tags:["item_swapper"]}
await delay 1t
data modify entity @e[type=armor_stand,tag=item_swapper,limit=1] ArmorItems[3] set from entity @e[type=item,distance=..6,limit=1,nbt={Item:{id:"minecraft:bucket",Count:1b,tag:{gm4_metallurgy:{active_shamir:"infinitas"}}}}]
item replace entity @s weapon.mainhand from entity @e[type=armor_stand,tag=item_swapper,limit=1] armor.head

await entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"infinitas"}}}}]

setblock ~1 ~4 ~1 water

dummy @s use item

await delay 2t

assert entity @s[nbt={SelectedItem:{tag:{gm4_metallurgy:{active_shamir:"infinitas"}}}}]
