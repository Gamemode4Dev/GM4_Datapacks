# @s = player capturing a soul fragment while holding soul lanters in offhand / player releasing a held soul in a lantern
# from player/spawn_fragment_offhand or player/items/capture_in_offhand

# copy the item to a storage, take one, store it the first slot of the The Yellow Shulker Box™, and put it back in the player's hand

data modify storage gm4_soul_fragments:temp/item/soul_lantern Item set from entity @s Inventory[{Slot:-106b}]

execute store result storage gm4_soul_fragments:temp/item/soul_lantern Item.Count byte 1 run data get storage gm4_soul_fragments:temp/item/soul_lantern Item.Count 0.99

data modify storage gm4_soul_fragments:temp/item/soul_lantern Item.Slot set value 0b

execute in overworld run data modify block 29999998 1 7134 Items append from storage gm4_soul_fragments:temp/item/soul_lantern Item

loot replace entity @s weapon.offhand 1 mine 29999998 1 7134 minecraft:air{drop_contents: 1b}

# if not capturing (taking damage), give a soul lantern
give @s[tag=!gm4_sf_capturing] soul_lantern 1
