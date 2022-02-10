# copies item data of items with animi shamir into cache and deletes them from the world after they were dropped by a dying player
# @s = item with animi shamir, just dropped by a dying player
# at location of dying player
# run from gm4_animi_shamir:player/upon_death

# add this item nbt to storage
data modify storage gm4_animi_shamir:cache prepared_entry.inventory append from entity @s Item

# visuals
particle minecraft:soul ~ ~0.9 ~ 0.2 0.6 0.2 0.04 1

# remove this item from the world
kill @s
