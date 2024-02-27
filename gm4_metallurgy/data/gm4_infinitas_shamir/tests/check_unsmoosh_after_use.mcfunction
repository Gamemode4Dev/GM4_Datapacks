# @template gm4_metallurgy:test_smooshing
# @dummy ~0.5 ~4 ~1.5

execute at @s run tp @s ~ ~ ~ 270 50

summon item ~1.5 ~2.5 ~1.5 {Item:{id:"minecraft:bucket",Count:1b}}
loot spawn ~1.5 ~2.5 ~1.5 loot gm4_infinitas_shamir:band

await delay 1s

setblock ~1 ~4 ~1 redstone_block

await entity @e[type=item,distance=..6,nbt={Item:{id:"minecraft:obsidian"}}]

# equip smooshed infinitas bucket
tp @e[type=item,distance=..6,sort=nearest,limit=1,nbt={Item:{id:"minecraft:bucket",Count:1b,tag:{gm4_metallurgy:{active_shamir:"infinitas"}}}}] @s
await predicate gm4_infinitas_shamir:mainhand/holding/empty


setblock ~0 ~4 ~1 glass
setblock ~2 ~4 ~1 glass
setblock ~1 ~4 ~0 glass
setblock ~1 ~4 ~2 glass
setblock ~1 ~4 ~1 water

dummy @s use item

await delay 2t

# above is check_empty_pickup
# below is unsmoosh
dummy @s drop
tp @e[type=item,distance=..6,sort=nearest,limit=1,nbt={Item:{id:"minecraft:bucket",Count:1b,tag:{gm4_metallurgy:{active_shamir:"infinitas"}}}}] ~1.5 ~2.5 ~1.5

await delay 1s

setblock ~1 ~4 ~1 redstone_block

await entity @e[type=item,distance=..6,nbt={Item:{id:"minecraft:player_head"}}]
execute unless data entity @e[type=item,limit=1,nbt={Item:{id:"minecraft:player_head"}}] Item.tag.gm4_metallurgy.stored_shamir run fail "Shamir did not unsmoosh properly"
execute unless data entity @e[type=item,limit=1,nbt={Item:{id:"minecraft:player_head"}}] Item.tag.display.Lore[2] run fail "Shamir did not unsmoosh properly"
