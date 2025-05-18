# @template gm4_metallurgy:test_smooshing
# @dummy ~0.5 ~4 ~1.5

# repeat steps from check_empty_pickup
execute at @s run tp @s ~ ~ ~ 270 50

summon item ~1.5 ~2.5 ~1.5 {Item:{id:"minecraft:bucket"}}
loot spawn ~1.5 ~2.5 ~1.5 loot gm4_infinitas_shamir:band

await delay 1s

setblock ~1 ~4 ~1 redstone_block

await items entity @e[type=item,distance=..6] contents minecraft:obsidian

execute as @e[type=item,distance=..6] if items entity @s contents minecraft:bucket run tag @s add gm4_test_infinitas_bucket
item replace entity @s weapon.mainhand from entity @e[type=item,tag=gm4_test_infinitas_bucket,distance=..6,limit=1] contents

await items entity @s weapon.mainhand *[custom_data~{gm4_metallurgy:{active_shamir:"infinitas"}}]

setblock ~1 ~4 ~1 water

dummy @s use item

await delay 2t

# below is unsmoosh
dummy @s drop
execute as @e[type=item,distance=..6] if items entity @s contents minecraft:bucket run tp @s ~1.5 ~2.5 ~1.5

await delay 1s
setblock ~1 ~4 ~1 redstone_block

await items entity @e[type=item,distance=..6] contents minecraft:player_head[custom_data~{gm4_metallurgy:{stored_shamir:"infinitas"}}]
execute as @e[type=item,distance=..6] if items entity @s contents minecraft:player_head unless data entity @s Item.components."minecraft:custom_data".gm4_metallurgy.stored_shamir run fail "Unsmooshed shamir did not properly transfer shamir to cast"
