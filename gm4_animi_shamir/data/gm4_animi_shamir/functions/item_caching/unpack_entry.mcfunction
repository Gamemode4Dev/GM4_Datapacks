# unpacks prepared_entry into items by summoning one item for each elements in prepared_entry.inventory
# @s = player who has died recently
# at @s
# run from gm4_animi_shamir:player/respawn_inventory

# summon item and populate item NBT
summon item ~ ~ ~ {Tags:["gm4_respawned_animi_item"],PickupDelay:0s,Item:{Count:1b,id:"minecraft:stone"}}
execute as @e[type=item,tag=gm4_respawned_animi_item,limit=1] run function gm4_animi_shamir:initialize_item

# visuals
particle minecraft:soul ~ ~0.9 ~ 0.2 0.6 0.2 0.04 1

# shift pointer forwards and loop
data remove storage gm4_animi_shamir:cache prepared_entry.inventory[0]
scoreboard players remove $loop gm4_animi_deaths 1
execute if score $loop gm4_animi_deaths matches 1.. run function gm4_animi_shamir:item_caching/unpack_entry
